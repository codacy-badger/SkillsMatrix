#!/bin/bash
./bash_destroy.sh
mkdir -m 777 mysql && chmod 777 mysql
git pull
cd docker_compose && docker-compose up --build --force-recreate -d