#!/bin/bash
# Setup server

loc=/root/server-config

echo "ubnode" > /etc/hostname

# setup greeting
chmod -x /etc/update-motd.d/*
chmod +x /etc/update-motd.d/00-header
chmod +x /etc/update-motd.d/50-landscape-sysinfo
chmod +x /etc/update-motd.d/9*

# install tools
apt update
apt install -y neovim nginx ranger rust zsh

# add users
bash $loc/user/penn.sh

# setup nginx
cp $loc/configs/nginx.conf /etc/nginx/nginx.conf
cp -rT $loc/configs/nginx-errors /etc/nginx/errors
