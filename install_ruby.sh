#!/bin/sh
set -eu
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
echo "=====check install ruby and bundler versions===="
echo $(ruby -v)
echo $(bundler -v)

