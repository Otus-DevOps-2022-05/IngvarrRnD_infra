#!/bin/sh
set -eu
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
sudo apt-get update
sudo apt-get install -y mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
sudo apt-get update
apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
