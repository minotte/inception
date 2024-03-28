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
    

# EXPOSE 9000