#!/bin/sh
# Setup user: penn

loc=/root/server-config

if id "penn" &>/dev/null; then
	exit 0
fi

useradd --create-home penn
passwd penn
usermod -a -G wheel penn

# copy needed scripts
cp $loc/user/ssh.sh /home/penn/.config_ssh.sh
cp $loc/user/penn/zshrc /home/penn/.zshrc
chown -R penn /home/penn
