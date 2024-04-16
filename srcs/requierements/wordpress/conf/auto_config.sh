# !/bin/sh

sleep 10



if [ ! -f /var/www/wordpress/wp-config.php ]; then
    ./wp-cli.phar core download  --allow-root 

    ./wp-cli.phar config create	--allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

    # Installer WordPress
    ./wp-cli.phar core install --allow-root \
        --url="https://nminotte.42.fr" \
        --title="My wonderful Site" \
        --admin_user="nminotte" \
        --admin_password="cestunSuperpwd!" \
        --locale="fr_FR" \
        --admin_email="nminotte@42angouleme.com" \
        --path='/var/www/wordpress'
fi

/usr/sbin/php-fpm81 -F