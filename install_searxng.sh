#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for searxng #"
echo "###########################################"
envsubst < $CODE_DIR/searxng/docker-compose.yml.template > $CODE_DIR/searxng/docker-compose.yml
cat $CODE_DIR/searxng/docker-compose.yml


echo "###########################################"
echo "# Creating settings.yml for searxng #"
echo "###########################################"
envsubst < $CODE_DIR/searxng/searxng/settings.yml.template > $CODE_DIR/searxng/searxng/settings.yml
cat $CODE_DIR/searxng/searxng/settings.yml


echo "####################"
echo "# Starting searxng #"
echo "####################"
docker-compose -f $CODE_DIR/searxng/docker-compose.yml up -d
