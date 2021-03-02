#!/bin/sh
# Setup user: penn

user=penn
loc=/root/server-config

if id "$user" &>/dev/null; then
	exit 0
fi

useradd --create-home $user
passwd $user
usermod -a -G sudo $user

# copy needed scripts
cp $loc/user/ssh.sh /home/$user/.config_ssh.sh
cp $loc/user/zshrc-init /home/$user/.zshrc
chown -R $user /home/$user
