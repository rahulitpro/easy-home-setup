#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for heimdall #"
echo "###########################################"
envsubst < $CODE_DIR/heimdall/docker-compose.yml.template > $CODE_DIR/heimdall/docker-compose.yml
cat $CODE_DIR/heimdall/docker-compose.yml

echo "####################"
echo "# Starting heimdall #"
echo "####################"
docker-compose -f $CODE_DIR/heimdall/docker-compose.yml up -d
