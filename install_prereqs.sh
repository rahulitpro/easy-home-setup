#!/bin/bash

echo "#########################"
echo "# Updating repositories #"
echo "#########################"
sudo apt update

echo "#####################"
echo "# Installing Docker #"
echo "#####################"
sudo apt install docker.io docker-compose -y
sudo usermod -aG docker $USER

echo "###########################"
echo "# Creating docker network #"
echo "###########################"
sudo docker network create web

echo "############################"
echo "# Installing apache2-utils #"
echo "############################"
sudo apt-get install apache2-utils -y

echo "############################"
echo "# Stopping System resolved #"
echo "############################"
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo sed -i 's/nameserver 127.0.0.53/nameserver 8.8.8.8/g' /etc/resolv.conf
