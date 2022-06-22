#!/bin/sh
set -eu
sudo apt-get update
apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
echo "=====check status puma====="
ps aux | grep puma
