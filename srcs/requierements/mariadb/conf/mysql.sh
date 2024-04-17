#!/bin/sh

#chmod 644 /var/lib/mysql
chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf ;
service mariadb start;
sleep 5;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
#mariadb -e "USE \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mariadb -e "DROP TABLE IF EXISTS mariadb_users;"
# mariadb -e "DROP TABLE IF EXISTS mariadb_posts;"
mariadb -e "FLUSH PRIVILEGES;"
mariadb-admin -u root -p$MYSQL_ROOT_PASSWORD shutdown
#exec mariadbd-safe
mysqld