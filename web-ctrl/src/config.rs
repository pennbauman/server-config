// config - server.pennbauman.com
//   URL: https://github.com/pennbauman/server
//   Author:
//     Penn Bauman (pennbauman@protonmail.com)
use std::env;

// ENV
pub async fn host() -> Result<String, env::VarError> {
    Ok(env::var("TIDE_ADDR")? + ":" + &(env::var("TIDE_PORT")?))
}
pub async fn pennbauman_dir() -> Result<String, env::VarError> {
    Ok(env::var("PENNBAUMAN_COM")?)
}
