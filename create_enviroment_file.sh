#!/bin/bash

if [ ! -f $PWD/.env ]
then
	touch .env
fi

found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "CODE_DIR" | wc -l` > /dev/null 2>&1
if [ $found -gt 0 ]
then
	echo "Variable CODE_DIR, already defined"
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "CODE_DIR"
else
	echo "export CODE_DIR='${PWD}'" >> $PWD/.env
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "CODE_DIR"
fi

found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "PUID" | wc -l` > /dev/null 2>&1
if [ $found -gt 0 ]
then
	echo "Variable PUID, already defined"
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "PUID"
else
	PUID=`cat /etc/passwd | grep $USER | awk -F ":" '{print $3}'`
	echo "export PUID='${PUID}'">> $PWD/.env
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "PUID"
fi

found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "PGID" | wc -l` > /dev/null 2>&1
if [ $found -gt 0 ]
then
        echo "Variable PGID, already defined"
        cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "PGID"
else
        PGID=`cat /etc/passwd | grep $USER | awk -F ":" '{print $4}'`
        echo "export PGID='${PGID}'">> $PWD/.env
        cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "PGID"
fi

check_update_variable(){
	found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "${2}" | wc -l` > /dev/null 2>&1
	if [ $found -gt 0 ]
	then
		echo "Variable ${2}, already defined"
		cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "${2}" 
	else
		read -p "${1}" VALUE
		echo "export ${2}='${VALUE}'" >> $PWD/.env
		cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "${2}"
	fi
}

check_update_variable "Enter your display name (like Firstname Lastname) :" DISPLAY_NAME
check_update_variable "Enter your email address for let's encrypt (like me@example.com) :" LETSENCRYPT_EMAIL
check_update_variable "Enter your timezone (like America/Toronto) :" USER_TIMEZONE 
check_update_variable "Enter your main domain name with tld (like example.com) :" DOMAIN
check_update_variable "Enter your traefik subdomain name for traefik dashboard (like traefik) :" TRAEFIK_SUBDOMAIN
check_update_variable "Enter your Public CIDR for home network to restrict some of the services from public (like 12.34.56.78/32) :" HOME_CIDR 

found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "TRAEFIK_PASSWORD" | wc -l` > /dev/null 2>&1
if [ $found -gt 0 ]
then
        echo "Variable TRAEFIK_PASSWORD, already defined"
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "TRAEFIK_PASSWORD"
else
	read -p "Enter your traefik password, this script will assume your username as admin:" TRAEFIK_PASSWORD
	TRAEFIK_PASSWORD=`htpasswd -nbB admin ${TRAEFIK_PASSWORD}`
	echo "export TRAEFIK_PASSWORD='${TRAEFIK_PASSWORD}'" >> $PWD/.env
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "TRAEFIK_PASSWORD"
fi


check_update_variable "Enter your authelia subdomain name for authentication url (like auth) :" AUTHELIA_SUBDOMAIN 

found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "AUTHELIA_PASSWORD" | wc -l` > /dev/null 2>&1
if [ $found -gt 0 ]
then
	echo "Variable AUTHELIA_PASSWORD, already defined"
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "AUTHELIA_PASSWORD"
else
	read -p "Enter your authelia password :" AUTHELIA_PASSWORD
        AUTHELIA_PASSWORD=`docker run --name autheliapass authelia/authelia:latest authelia hash-password ${AUTHELIA_PASSWORD} | awk '{print $2}'`
	echo "export AUTHELIA_PASSWORD='${AUTHELIA_PASSWORD}'" >> $PWD/.env
	docker rm autheliapass
	docker rmi authelia/authelia
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "AUTHELIA_PASSWORD"
fi

check_update_variable "Enter your authelia jwt secret :" AUTHELIA_JWT_SECRET 
check_update_variable "Enter your authelia storage encryption key :" AUTHELIA_STORAGE_KEY 
check_update_variable "Enter your heimdell subdomain (like dash) :" HEIMDALL_SUBDOMAIN 

found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "SEARXNG_ULTRASECRET" | wc -l` > /dev/null 2>&1
if [ $found -gt 0 ]
then
	echo "Variable SEARXNG_ULTRASECRET, already defined"
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "SEARXNG_ULTRASECRET"
else
	SEARXNG_ULTRASECRET=`openssl rand -hex 32`
	echo "export SEARXNG_ULTRASECRET='${SEARXNG_ULTRASECRET}'" >> $PWD/.env
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "SEARXNG_ULTRASECRET"
fi

check_update_variable "Enter your searxng subdomain (like search) :" SEARXNG_SUBDOMAIN

check_update_variable "Enter your wordpress subdomain (like www) :" WORDPRESS_SUBDOMAIN
check_update_variable "Enter your adminer subdomain (like dbadmin) :" ADMINER_SUBDOMAIN
check_update_variable "Enter your mariadb db root user password :" MYSQL_ROOT_PASSWORD 
check_update_variable "Enter your mariadb db wordpress user (wpusr) password :" WORDPRESS_DB_PASSWORD 

check_update_variable "Enter your jellyfin subdomain (link media) :" JELLYFIN_SUBDOMAIN 


check_update_variable "Enter your nextcloud subdomain (link next) :" NEXTCLOUD_SUBDOMAIN 
check_update_variable "Enter your mariadb db nextcloud user (ncusr) password :" NEXTCLOUD_DB_PASSWORD 

check_update_variable "Enter your pihole dashboard subdomain (link dns) :" PIHOLE_SUBDOMAIN 
check_update_variable "Enter your pihole password :" PIHOLE_PASSWORD 
