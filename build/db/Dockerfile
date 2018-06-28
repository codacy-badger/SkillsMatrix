FROM mysql:5.7

ADD dump.sql /docker-entrypoint-initdb.d

RUN mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER 'skillsmatrixuser'@'localhost' IDENTIFIED BY '123456';"
RUN mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER 'GRANT ALL PRIVILEGES ON skillsmatrix.* TO 'skillsmatrixuser'@'localhost';"



