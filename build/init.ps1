./destroy.ps1

mkdir mysql
mkdir www

docker-compose up --build --force-recreate -d

mv private www/
mv public www/

