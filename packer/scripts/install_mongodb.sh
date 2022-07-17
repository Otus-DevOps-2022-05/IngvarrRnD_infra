#!/bin/sh
sudo apt-get update
echo "sleep 1m for install updates"; sleep 1m; echo "start install mongodb"
sudo apt-get install -y mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
echo "=====check status mongodb====="
sudo systemctl status mongodb
