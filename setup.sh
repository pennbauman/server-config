#!/bin/bash
# Setup server

loc=/root/server-config
name=ubnode


echo $name > /etc/hostname
hostname $name

# setup greeting
chmod -x /etc/update-motd.d/*
chmod +x /etc/update-motd.d/00-header
chmod +x /etc/update-motd.d/50-landscape-sysinfo
chmod +x /etc/update-motd.d/9*

# install tools
apt update
apt install -y neovim nginx ranger cargo zsh nodejs

bash $loc/user/ssh.sh

# add users
bash $loc/user/penn.sh
chsh -s /bin/zsh

# setup nginx
mkdir -p /etc/nginx
cp $loc/configs/nginx.conf /etc/nginx/nginx.conf
cp -rT $loc/configs/nginx-errors /etc/nginx/errors
