# !/bin/sh

sleep 10



if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp-cli.phar core download  --allow-root 

    wp-cli.phar config create	--allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'

    # Installer WordPress
    wp-cli.phar core install --allow-root \
        --url=$WP_URL \
        --title="My wonderful Site" \
        --admin_user=$WP_DB_ADMIN \
        --admin_password=$WP_DB_PASSWORD \
        --locale="fr_FR" \
        --admin_email=$WP_EMAIL \
        --path='/var/www/wordpress'
    
    wp-cli.phar user create  \
        $WP_DB_USER \
        $WP_EMAIL_USER\
        --role='author' \
        --user_pass=$WP_USER_PASS \
        --path='/var/www/wordpress'
       

fi

exec /usr/sbin/php-fpm81 -F
