FROM alpine:3.14

RUN apk update  && apk add wget && apk add --no-cache \
		php        \
		php-mysqli       \
		php-fpm        \
		php-phar        \ 
		mariadb-client	  \
		vim

RUN  wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www  && \
	cd /var/www && \
	tar -xvf wordpress-6.4.2-fr_FR.tar.gz && \ 
	rm wordpress-6.4.2-fr_FR.tar.gz && \
	chown -R root:root /var/www/wordpress

COPY www.conf   /etc/php7/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar                    && \
	mv wp-cli.phar /usr/local/bin/wp        && \
	mkdir -p /etc/wordpress                 && \
	chown  -R root:root  /etc/wordpress

COPY conf/auto_config.sh /etc/wordpress/

RUN chmod +x  /etc/wordpress/auto_config.sh

ENTRYPOINT ["sh",  "/etc/wordpress/auto_config.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-F"] 
