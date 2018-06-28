#!/bin/bash

docker-compose up --build -d

git clone https://github.com/luiz1361/SkillsMatrix.git www/

cp db.inc.php www/SkillsMatris/private/
