#!/bin/sh

apk add netcat-openbsd bc curl wget git openssl zsh libressl

cd /tmp/
git clone https://github.com/Neilpang/acme.sh.git
cd acme.sh/
./acme.sh --install
