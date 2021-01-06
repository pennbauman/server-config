#!/bin/sh
# Setup user: website

loc=/root/server-config

if id "website" &>/dev/null; then
	exit 0
fi

useradd --create-home -d /var/website website

cp $loc/user/website/zshrc /var/website/.zshrc
chwon -R website /var/website

#if [ ! -f /var/website/.gitconfig ]; then
	#cp /home/penn/.config/git/config /var/website/.gitconfig
	#chown website /var/website/.gitconfig
#fi
git config pull.ff only


