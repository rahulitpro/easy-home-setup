#!/bin/bash

. ../.env
envsubst < docker-compose.yml.template 
