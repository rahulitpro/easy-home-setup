#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for portainer #"
echo "###########################################"
envsubst < $CODE_DIR/portainer/docker-compose.yml.template > $CODE_DIR/portainer/docker-compose.yml
cat $CODE_DIR/portainer/docker-compose.yml

echo "####################"
echo "# Starting portainer #"
echo "####################"
docker-compose -f $CODE_DIR/portainer/docker-compose.yml up -d
