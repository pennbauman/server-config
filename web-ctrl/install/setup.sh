#!/bin/sh
# Setup web control server

loc=/root/server-config

cd $loc/web-ctrl

cargo build --release

systemctl stop server.pennbauman.com.service

cp $loc/web-ctrl/target/release/web-ctrl /bin/server.pennbauman.com

cp $loc/web-ctrl/install/systemd.service /etc/systemd/system/server.pennbauman.com.service
cp $loc/web-ctrl/install/nginx.conf /etc/nginx/conf.d/server.pennbauman.com.conf

systemctl daemon-reload
systemctl restart nginx.service
systemctl enable server.pennbauman.com.service
systemctl start server.pennbauman.com.service
