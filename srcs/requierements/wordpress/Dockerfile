FROM alpine:3.18

RUN apk update  && apk add wget && apk add --no-cache \
		wget			\
		php     	   \
		php-mysqli		\
		php-fpm		   \
		php-phar        \ 
		mariadb-client	  \
		vim

RUN  wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www  && \
	cd /var/www && \
	tar -xvf wordpress-6.4.2-fr_FR.tar.gz && \ 
	rm wordpress-6.4.2-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

COPY /conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY /conf/auto_config.sh /home/
RUN chmod 775 /home/auto_config.sh


ENTRYPOINT ["sh", "/home/auto_config.sh"]