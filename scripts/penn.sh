#!/bin/sh
# Setup penn

if [[ $(users | grep penn) == 0 ]]; then
	useradd --create-home penn
	passwd penn
	usermod -a -G wheel penn
fi


cp scripts/ssh.sh /home/penn/config_ssh.sh

chown -R penn /home/penn

sudo -u penn bash /home/penn/config_ssh.sh

rm -f /home/penn/config_*.sh


sudo -u penn git clone git@github.com:pennbauman/dotfiles.git /home/penn/.dotfiles
sudo -u penn bash /home/penn/.dotfiles/server/setup.sh

