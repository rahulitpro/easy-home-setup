#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for authelia #"
echo "###########################################"
envsubst < $CODE_DIR/authelia/docker-compose.yml.template > $CODE_DIR/authelia/docker-compose.yml
cat $CODE_DIR/authelia/docker-compose.yml

echo "###########################################"
echo "# Creating users_database.yml for authelia #"
echo "###########################################"
envsubst < $CODE_DIR/authelia/users_database.yml.template > $CODE_DIR/authelia/config/users_database.yml
cat $CODE_DIR/authelia/config/users_database.yml

echo "###########################################"
echo "# Creating configuration.yml for authelia #"
echo "###########################################"
envsubst < $CODE_DIR/authelia/configuration.yml.template > $CODE_DIR/authelia/config/configuration.yml
cat $CODE_DIR/authelia/config/configuration.yml

echo "####################"
echo "# Starting authelia #"
echo "####################"
docker-compose -f $CODE_DIR/authelia/docker-compose.yml up -d
