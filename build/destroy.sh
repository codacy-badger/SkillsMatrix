#!/bin/bash
docker stop build_db_1
docker stop build_web_1
docker rm build_db_1
docker rm build_web_1
rm -Rf ./mysql
