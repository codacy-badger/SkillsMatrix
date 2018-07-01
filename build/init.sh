#!/bin/bash
./destroy.sh
mkdir -m 777 mysql && chmod 777 mysql
git pull
docker-compose up --build --force-recreate -d