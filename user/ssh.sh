#!/bin/bash
# Setup ssh

if [ ! -f $HOME/.ssh/id_rsa ]; then
	ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa -N ""
fi
if [[ ! $(ssh -T git@github.com 2>&1) =~ successfully ]]; then
	echo "Add RSA key to GitHub"
	echo ""
	cat $HOME/.ssh/id_rsa.pub
	echo ""
	while true; do
		read -p "Done? [y/n]: " input
		case $input in
			y|Y) break;;
			n|N) exit 0
				break;;
			*) ;;
		esac
	done
fi
