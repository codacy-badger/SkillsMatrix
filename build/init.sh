#!/bin/bash

mkdir mysql && chmod 777 mysql
mkdir www && chmod 777 www

docker-compose up --build --force-recreate -d

git clone https://github.com/luiz1361/SkillsMatrix.git www/

