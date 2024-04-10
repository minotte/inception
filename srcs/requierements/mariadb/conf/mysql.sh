#!/bin/sh

service mariadb start;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mariadbd-safe