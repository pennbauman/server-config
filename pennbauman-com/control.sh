#!/bin/sh
# Setup pennbauman.com website

remote=https://github.com/pennbauman/pennbauman.com.git
loc=/var/website/pennbauman-com
file=$loc/site.json

mkdir -p $loc
chown -R website $loc

if [ ! -f $file ]; then
	echo "not found: '$file'"
	exit 1
fi

get_id () {
	i=0
	while true; do
		if [[ $(json $i branch) == "$1" ]]; then
			echo $i
			return
		fi

		i=$(($i + 1))
		if [[ $(jq ".[$i]" $file) == "null" ]]; then
			break
		fi
	done
	echo "none"
}

json () {
	echo $(jq ".[$1].$2" -r $file)
}

name () {
	echo $(json $1 url | sed 's/,.*//')
}

update () {
	if [[ -d $loc/$(json $1 dir) ]]; then
		cd $loc/$(json $1 dir)
		git checkout $(json $1 branch)
		git pull
	else
		git clone "$remote" $loc/$(json $1 dir) --branch $(json $1 branch)
	fi
}

build () {
	cd $loc/$(json $1 dir)
	cargo build --release
	python3 scripts/build.py
}

reload () {
	systemctl stop "$(name $1).service"
	cp target/release/pennbauman_com /bin/$(name $1)
	systemctl daemon-reload
	systemctl start "$(name $1).service"
}


# MAIN
if (( $# > 0 )); then
	id=$(get_id $1)
	#echo $id
	if [[ $id == none ]]; then
		echo "unknown branch"
		exit 1
	fi

	update $id
	build $id
	reload $id

	exit 0
else
	i=0
	while true; do
		name $i

		update $i
		build $i
		reload $i

		i=$(($i + 1))
		if [[ $(jq ".[$i]" $file) == "null" ]]; then
			break
		fi
	done
fi
