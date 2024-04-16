FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install wget -y && \
	apt-get install mariadb-server -y && \
	apt-get install mariadb-client -y
	

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /conf/mysql.sh /etc/mysql/mariadb.conf.d/

#RUN touch /var/log/mysql/error.log

EXPOSE	3306

RUN chmod 775 /etc/mysql/mariadb.conf.d/mysql.sh && \
	chown -R mysql:mysql /var/lib/mysql


ENTRYPOINT ["sh", "/etc/mysql/mariadb.conf.d/mysql.sh"]