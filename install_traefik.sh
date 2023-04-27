#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for traefik #"
echo "###########################################"
envsubst < $CODE_DIR/traefik/docker-compose.yml.template > $CODE_DIR/traefik/docker-compose.yml
cat $CODE_DIR/traefik/docker-compose.yml

echo "#############################################"
echo "# Creating traefik_dynamic.toml for traefik #"
echo "#############################################"
envsubst < $CODE_DIR/traefik/traefik_dynamic.toml.template > $CODE_DIR/traefik/traefik_dynamic.toml
cat $CODE_DIR/traefik/traefik_dynamic.toml

echo "#############################################"
echo "# Creating traefik.toml for traefik #"
echo "#############################################"
envsubst < $CODE_DIR/traefik/traefik.toml.template > $CODE_DIR/traefik/traefik.toml
cat $CODE_DIR/traefik/traefik.toml

echo "###########################"
echo "# Creating acme.json file #"
echo "###########################"
touch $CODE_DIR/traefik/acme.json
chmod 600 $CODE_DIR/traefik/acme.json
ls -l $CODE_DIR/traefik/acme.json

echo "####################"
echo "# Starting traefik #"
echo "####################"
docker-compose -f $CODE_DIR/traefik/docker-compose.yml up -d
