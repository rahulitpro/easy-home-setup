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
	echo "CODE_DIR=${PWD}" >> $PWD/.env
	cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "CODE_DIR"
fi

check_update_variable(){
	found=`cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "${2}" | wc -l` > /dev/null 2>&1
	if [ $found -gt 0 ]
	then
		echo "Variable ${2}, already defined"
		cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "${2}" 
	else
		read -p "${1}" VALUE
		echo "${2}=${VALUE}" >> $PWD/.env
		cat $PWD/.env | grep -v '^$' | grep -v '^#' | grep -w "${2}"
	fi
}

check_update_variable "Enter your email address for let's encrypt (like me@example.com) :" LETSENCRYPT_EMAIL
check_update_variable "Enter your main domain name with tld (like example.com) :" DOMAIN
check_update_variable "Enter your traefik subdomain name for traefik dashboard (like traefik) :" TRAEFIK_SUBDOMAIN
check_update_variable "Enter your Public CIDR for home network to restrict some of the services from public (like 12.34.56.78/32) :" HOME_CIDR 
