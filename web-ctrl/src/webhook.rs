// webhook - server.pennbauman.com
//   url: https://github.com/pennbauman/server
//   author:
//     penn bauman (pennbauman@protonmail.com)
use tide::{Request, Response};
use serde_json::Value;
use std::process::Command;
use crate::config;

pub async fn routes(app: &mut tide::Server<()>) {
    app.at("/pennbauman-com/webhook").post(|mut req: Request<()>| async move {
        let body: Value = req.body_json().await?;
        //if body["repository"]["name"] != "pennbauman-com" {
        if body["repository"]["name"] != "test" {
            return Ok(Response::new(406));
        }
        let full_ref = match body["ref"].as_str() {
            Some(r) => r,
            None => return Ok(Response::new(406)),
        };
        let mut branch = "";
        for part in full_ref.split("/") {
            branch = part;
        }

        let mut script = config::pennbauman_dir().await?;
        script.push_str("/control.sh");
        let mut update = Command::new("bash");
        update.arg(script)
            .arg(branch);
        let result = update.output().expect("failed to execute process");
        if ! result.status.success() {
            return Ok(Response::new(417));
        }

        Ok(Response::new(200))
    });
}
