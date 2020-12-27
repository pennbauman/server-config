#!/bin/sh
# Setup website

loc=/var/website/temp

if [[ $(users | grep website) == 0 ]]; then
	useradd --create-home -d /var/website website
fi

if [ ! -f /var/website.gitconfig ]; then
	cp /home/penn/.config/git/config /var/website/.gitconfig
	chown website /var/website/.gitconfig
	git config pull.ff only
fi

mkdir -p $loc
chown -R website $loc

cp scripts/ssh.sh /var/website/config_ssh.sh
cp scripts/sites.py $loc/sites.py
cp sites.json $loc/sites.json
cp -rT templates $loc/.templates

chown -R website /var/website
chown -R website $loc

sudo -u website bash /var/website/config_ssh.sh
sudo -u website python $loc/sites.py clone
sudo -u website python $loc/sites.py build
sudo -u website python $loc/sites.py systemd
sudo -u website python $loc/sites.py nginx


for s in $loc/.systemd/*; do
	systemctl stop $(basename $s)
done
systemctl daemon-reload

bash scripts/cp.sh $loc/cp.txt
rm -f $loc/cp.txt

for s in $loc/.systemd/*; do
	#echo "systemctl enable $s"
	systemctl enable $(basename $s)
	systemctl start $(basename $s)
done
systemctl restart nginx


rm -f /var/website/config_*.sh

