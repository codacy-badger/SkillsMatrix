#!/bin/bash

./destroy.sh

mkdir mysql && chmod 777 mysql
mkdir www && chmod 777 www

docker-compose up --build --force-recreate -d

mv private www/
mv public www/