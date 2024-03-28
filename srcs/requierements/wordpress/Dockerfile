FROM alpine:3.14

RUN apk update  && apk add wget && apk add --no-cache \
    php        \
    php-mysqli       \
    php-fpm         \
    mariadb-client  \
    vim

RUN  wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www  && \
    cd /var/www && \
    tar -xvf wordpress-6.4.2-fr_FR.tar.gz && rm wordpress-6.4.2-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress

COPY www.conf   /etc/php7/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar                    && \
	mv wp-cli.phar /usr/local/bin/wp        
RUN    mkdir -p /etc/wordpress               

RUN     -R root:root  /etc/wordpress

COPY conf/auto-config.sh /etc/wordpress/

RUN chmod 775 /etc/wordpress/auto-config.sh

ENTRYPOINT ["/bin/sh", "-c", "/etc/wordpress/auto-config.sh"]