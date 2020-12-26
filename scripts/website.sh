#!/bin/sh
# Setup website

loc=/var/website/temp

if [[ $(users | grep website) == 0 ]]; then
	useradd --create-home -d /var/website website
fi

mkdir -p $loc
chown -R website $loc

cp scripts/ssh.sh /var/website/config_ssh.sh
cp scripts/sites.py $loc/sites.py
cp sites.json $loc/sites.json

chown -R website /var/website

sudo -u website bash /var/website/config_ssh.sh
sudo -u website python $loc/sites.py

rm -f /var/website/config_*.sh
