FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install wget -y &&\
	apt-get install mariadb-server -y 
RUN	apt-get update -y && \
	apt-get upgrade -y 

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /conf/mysql.sh /etc/mysql/mariadb.conf.d/

EXPOSE	3306

RUN chmod 775 /etc/mysql/mariadb.conf.d
RUN	mkdir /run/mysqld
RUN	chmod 775 /run/mysqld


#ENTRYPOINT ["sh", "/etc/mysql/mariadb.conf.d/mysql.sh"]