#!/bin/sh

docker-compose pull
docker-compose up --no-start

cp gitea-nginx.conf /etc/nginx/conf.d/
cp config.toml /www/gitea/data/gitea/conf/app.ini

docker-compose start
