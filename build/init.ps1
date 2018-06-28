mkdir mysql
mkdir www

docker-compose up --build --force-recreate -d

git clone https://github.com/luiz1361/SkillsMatrix.git www/


