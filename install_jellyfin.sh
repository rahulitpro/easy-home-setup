#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for jellyfin #"
echo "###########################################"
envsubst < $CODE_DIR/jellyfin/docker-compose.yml.template > $CODE_DIR/jellyfin/docker-compose.yml
cat $CODE_DIR/jellyfin/docker-compose.yml

echo "####################"
echo "# Starting jellyfin #"
echo "####################"
docker-compose -f $CODE_DIR/jellyfin/docker-compose.yml up -d
