// config - server.pennbauman.com
//   URL: https://github.com/pennbauman/server
//   Author:
//     Penn Bauman (pennbauman@protonmail.com)
use std::fs::File;
use std::{io, io::prelude::*};
use std::env;
use toml::Value;

// ENV
pub async fn host() -> Result<String, env::VarError> {
    Ok(env::var("TIDE_ADDR")? + ":" + &(env::var("TIDE_PORT")?))
}
pub async fn pennbauman_dir() -> Result<String, env::VarError> {
    Ok(env::var("PENNBAUMAN_COM")?)
}

pub async fn github_secret(name: &str) -> Result<String, io::Error> {
    // get file
    let file_path = match env::var("SECRETS_FILE") {
        Ok(x) => x,
        Err(_) => return Err(io::Error::new(io::ErrorKind::NotFound, "env var missing")),
    };
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;

    // parse file as toml
    let parse_err = io::Error::new(io::ErrorKind::NotFound, "parse failed");
    let data: Value = match contents.parse() {
        Ok(x) => x,
        Err(_) => return Err(parse_err),
    };
    let github = match data.get("github") {
        Some(x) => x,
        None => return Err(parse_err),
    };
    let secret = match github.get(name) {
        Some(x) => x,
        None => return Err(parse_err),
    };
    return match secret.as_str() {
        Some(s) => Ok(String::from(s)),
        None => Err(parse_err),
    }
}
