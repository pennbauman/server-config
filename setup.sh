#!/bin/bash
# Setup server

loc=/root/server-config

hostname server
setsebool -P httpd_can_network_connect=1

# install tools
dnf install -y neovim nginx python3-jinji2 python3-toml ranger rust zsh

# add users
bash $loc/user/penn/user.sh
bash $loc/user/website/user.sh


# setup nginx
cp $loc/configs/nginx.conf /etc/nginx/nginx.conf
