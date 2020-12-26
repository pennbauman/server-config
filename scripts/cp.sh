#!/bin/sh
# Copy based on file contents

if (( $# < 1 )); then
	echo "Requires file"
	exit 1
fi

while read line; do
	cp $line
done < $1
