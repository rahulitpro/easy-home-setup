#!/bin/bash
docker-compose -f authelia/docker-compose.yml down
sudo rm -fv authelia/config/configuration.yml
