#!/bin/sh
# Install pennbauman.com website

loc=/var/website/pennbauman-com
src=/root/server-config

if [[ $(realpath $(pwd)/$BASH_SOURCE) != $src/pennbauman-com/install.sh ]]; then
	echo "bad dir '$(realpath $BASH_SOURCE)'"
	exit 1
fi

cd $src

mkdir -p $loc
chown -R website $loc

cp $src/pennbauman-com/control.sh $src/pennbauman-com/site.json $loc

python $src/pennbauman-com/templates.py $src/pennbauman-com/site.json

cp $src/pennbauman-com/.nginx/* /etc/nginx/conf.d
cp $src/pennbauman-com/.systemd/* /etc/systemd/system

systemctl daemon-reload
for s in $src/pennbauman-com/.systemd/*; do
	systemctl enable $(basename $s)
done
systemctl restart nginx

rm -rf $src/pennbauman-com/.nginx $src/pennbauman-com/.systemd

bash $loc/control.sh
