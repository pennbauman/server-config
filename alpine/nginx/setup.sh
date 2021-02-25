#!/bin/sh

apk update
apk add nginx

adduser -D -g 'www' www

mkdir -p /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

cp nginx.conf /etc/nginx/nginx.conf
cp -rT errors /etc/nginx/errors

rc-service nginx start
