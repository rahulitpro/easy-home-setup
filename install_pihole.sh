#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for pihole #"
echo "###########################################"
envsubst < $CODE_DIR/pihole/docker-compose.yml.template > $CODE_DIR/pihole/docker-compose.yml
cat $CODE_DIR/pihole/docker-compose.yml

echo "####################"
echo "# Starting pihole #"
echo "####################"
docker-compose -f $CODE_DIR/pihole/docker-compose.yml up -d
