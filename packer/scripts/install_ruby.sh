#!/bin/sh
sudo apt update
echo "sleep 1m for install updates"; sleep 1m; echo "start install ruby"
sudo rm /var/lib/dpkg/lock-frontend
sudo apt install -y ruby-full ruby-bundler build-essential
echo "=====check install ruby and bundler versions===="
echo $(ruby -v)
echo $(bundler -v)

