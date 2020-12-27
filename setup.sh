#!/bin/bash
# Setup server

hostname server

python -m pip install jinja2 toml

bash scripts/penn.sh
bash scripts/website.sh

cp configs/nginx.conf /etc/nginx/nginx.conf

sudo setsebool -P httpd_can_network_connect=1
