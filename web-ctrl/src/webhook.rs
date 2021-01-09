// webhook - server.pennbauman.com
//   url: https://github.com/pennbauman/server
//   author:
//     penn bauman (pennbauman@protonmail.com)
use tide::{Request, Response, Body};
use serde_json::Value;
use std::process::Command;
use crate::config;
use sha2::{Sha256, Digest};

pub async fn routes(app: &mut tide::Server<()>) {
    app.at("/pennbauman-com/webhook").post(|mut req: Request<()>| async move {
        let body_data = req.body_bytes().await?;

        let check_hash = match req.header("X-Hub-Signature-256") {
            Some(r) => &r[0],
            None => return Ok(Response::new(406)),
        };
        println!("github: {}", check_hash);
        let mut body_hash = Sha256::new();
        body_hash.update("KG4tXyewSXAP8H8fC6tTMnQ8uaNxyjo8");
        body_hash.update(&body_data);
        print!("calced: sha256=");
        for i in body_hash.finalize() {
            print!("{:02x}", i);
        }
        println!("");

        let body_copy = Body::from_bytes(body_data);
        let body_vals: Value = body_copy.into_json().await?;
        if body_vals["repository"]["name"] != "pennbauman.com" {
            return Ok(Response::new(406));
        }
        let full_ref = match body_vals["ref"].as_str() {
            Some(r) => r,
            None => return Ok(Response::new(406)),
        };
        let mut branch = "";
        for part in full_ref.split("/") {
            branch = part;
        }

        let mut script = config::pennbauman_dir().await?;
        script.push_str("/control.sh");

        update(&script, branch).await;

        Ok(Response::new(200))
    });
}

#[allow(unused_must_use)]
async fn update(script: &str, branch: &str) {
    let mut cmd = Command::new("bash");
    cmd.arg(script).arg(branch).arg("&");
    cmd.spawn();
    //if ! result.status.success() {
        //return Ok(Response::new(417));
    //}
}
