FROM debian:buster

RUN apt update -y && \
	apt-get install mariadb-server -y \
	vim 

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /conf/mysql.sh /etc/mysql/mariadb.conf.d/

EXPOSE	3306

RUN chmod 775 /etc/mysql/mariadb.conf.d/

ENTRYPOINT ["sh", "/etc/mysql/mariadb.conf.d/mysql.sh"]
