// webhook - server.pennbauman.com
//   url: https://github.com/pennbauman/server
//   author:
//     penn bauman (pennbauman@protonmail.com)
use tide::{Request, Response, Body};
use serde_json::Value;
use std::process::Command;
use crate::config;
use sha2::Sha256;
use hmac::{Hmac, Mac, NewMac};

pub async fn routes(app: &mut tide::Server<()>) {
    app.at("/pennbauman-com/webhook").post(|mut req: Request<()>| async move {
        let body_data = req.body_bytes().await?;

        // get hash from github
        let check_hash = match req.header("X-Hub-Signature-256") {
            Some(r) => r.as_str(),
            None => return Ok(Response::new(406)),
        };
        // calculate own hash
        let secret = config::github_secret("pennbauman-com").await?;
        let mut body_hash: Hmac<Sha256> = match Hmac::new_varkey(secret.as_bytes()) {
            Ok(hmac) => hmac,
            Err(_) => return Ok(Response::new(500)),
        };
        body_hash.update(&body_data);
        let mut hash_str = String::from("sha256=");
        for i in body_hash.finalize().into_bytes() {
            hash_str.push_str(&format!("{:02x}", i));
        }

        // compare hashes
        if check_hash != hash_str {
            println!("github: {}", check_hash);
            println!("calced: {}", hash_str);
            return Ok(Response::new(409));
        }

        // check body
        let body_copy = Body::from_bytes(body_data);
        let body_vals: Value = body_copy.into_json().await?;
        if body_vals["repository"]["name"] != "pennbauman.com" {
            return Ok(Response::new(406));
        }
        // get branch
        let full_ref = match body_vals["ref"].as_str() {
            Some(r) => r,
            None => return Ok(Response::new(406)),
        };
        let mut branch = "";
        for part in full_ref.split("/") {
            branch = part;
        }

        // update code
        let mut script = config::pennbauman_dir().await?;
        script.push_str("/control.sh");
        update(&script, branch).await;

        Ok(Response::new(200))
    });
}

// run update script
#[allow(unused_must_use)]
async fn update(script: &str, branch: &str) {
    let mut cmd = Command::new("bash");
    cmd.arg(script).arg(branch).arg("&");
    cmd.spawn();
    //if ! result.status.success() {
        //return Ok(Response::new(417));
    //}
}
