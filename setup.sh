#!/bin/bash
# Setup server

hostname server

bash scripts/penn.sh
bash scripts/website.sh

sudo setsebool -P httpd_can_network_connect=1
