#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for nextcloud #"
echo "###########################################"
envsubst < $CODE_DIR/nextcloud/docker-compose.yml.template > $CODE_DIR/nextcloud/docker-compose.yml
cat $CODE_DIR/nextcloud/docker-compose.yml

echo "####################"
echo "# Starting nextcloud #"
echo "####################"
docker-compose -f $CODE_DIR/nextcloud/docker-compose.yml up -d
