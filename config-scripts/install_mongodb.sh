#!/bin/sh
sudo apt-get update
sudo apt-get install -y mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
echo "=====check status mongodb====="
sudo systemctl status mongodb
