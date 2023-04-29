#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for wireguard #"
echo "###########################################"
envsubst < $CODE_DIR/wireguard/docker-compose.yml.template > $CODE_DIR/wireguard/docker-compose.yml
cat $CODE_DIR/wireguard/docker-compose.yml

echo "####################"
echo "# Starting wireguard #"
echo "####################"
docker-compose -f $CODE_DIR/wireguard/docker-compose.yml up -d
