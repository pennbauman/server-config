#!/bin/bash
# Setup server

hostname server

python -m pip install toml

bash scripts/penn.sh
bash scripts/website.sh

sudo setsebool -P httpd_can_network_connect=1
