#!/bin/bash

echo "#########################"
echo "# Updating repositories #"
echo "#########################"
sudo apt update

echo "#####################"
echo "# Installing Docker #"
echo "#####################"
sudo apt install docker.io docker-compose -y


