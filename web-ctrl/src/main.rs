// server.pennbauman.com
//   url: https://github.com/pennbauman/server-config
//   author:
//     penn bauman (pennbauman@protonmail.com)
use tide::utils::After;
use tide::{Response, StatusCode};
mod config;
mod webhook;

#[async_std::main]
async fn main() -> tide::Result<()> {
    tide::log::start();
    let mut app = tide::new();

    // Print basic error messages
    app.with(After(|mut res: Response| async {
        match res.status() {
            StatusCode::Ok => Ok(res),
            _ => {
                let num: u16 = res.status().into();
                res.set_body(format!("{} : {}\n", num, res.status().canonical_reason()));
                Ok(res)
            },
        }
    }));

    webhook::routes(&mut app).await;

    // Basic Server
    app.listen(config::host().await?).await?;
    Ok(())
}

