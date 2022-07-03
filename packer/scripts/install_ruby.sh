#!/bin/sh
sudo apt update
sudo rm /var/lib/dpkg/lock-frontend
sudo apt install -y ruby-full ruby-bundler build-essential
echo "=====check install ruby and bundler versions===="
echo $(ruby -v)
echo $(bundler -v)

