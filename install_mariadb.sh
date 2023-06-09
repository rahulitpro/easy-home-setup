#!/bin/bash

echo "#########################"
echo "# Setting up Enviroment #"
echo "#########################"
. .env
cat $CODE_DIR/.env

echo "###########################################"
echo "# Creating docker-compose.yml for mariadb #"
echo "###########################################"
envsubst < $CODE_DIR/mariadb/docker-compose.yml.template > $CODE_DIR/mariadb/docker-compose.yml
cat $CODE_DIR/mariadb/docker-compose.yml

echo "####################################################"
echo "# Creating create_wordpress_db_user.sh for mariadb #"
echo "####################################################"
envsubst < $CODE_DIR/mariadb/create_wordpress_db_user.run.template > $CODE_DIR/mariadb/create_wordpress_db_user.run
cat $CODE_DIR/mariadb/create_wordpress_db_user.run
chmod 755 $CODE_DIR/mariadb/create_wordpress_db_user.run

echo "#########################WWWWWWWWW##################"
echo "# Creating create_nextcloud_db_user.sh for mariadb #"
echo "##################################WWWWWWWWW#########"
envsubst < $CODE_DIR/mariadb/create_nextcloud_db_user.run.template > $CODE_DIR/mariadb/create_nextcloud_db_user.run
cat $CODE_DIR/mariadb/create_nextcloud_db_user.run
chmod 755 $CODE_DIR/mariadb/create_nextcloud_db_user.run


echo "####################"
echo "# Starting mariadb #"
echo "####################"
docker-compose -f $CODE_DIR/mariadb/docker-compose.yml up -d

echo "###############################"
echo "# Wating for mariadb to start #"
echo "###############################"

sleep 60 

$CODE_DIR/mariadb/create_wordpress_db_user.run

$CODE_DIR/mariadb/create_nextcloud_db_user.run
