#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for wordpress #"
echo "###########################################"
envsubst < $CODE_DIR/wordpress/docker-compose.yml.template > $CODE_DIR/wordpress/docker-compose.yml
cat $CODE_DIR/wordpress/docker-compose.yml

echo "####################"
echo "# Starting wordpress #"
echo "####################"
docker-compose -f $CODE_DIR/wordpress/docker-compose.yml up -d
