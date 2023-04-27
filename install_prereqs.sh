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
