# !/bin/sh

sleep 10



./wp-cli.phar config create	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

# Installer WordPress
./wp-cli.phar core install --allow-root \
    --url="https://nminotte.42.com" \
    --title="My wonderful Site" \
    --admin_user="nminotte" \
    --admin_password="mySuperpwd" \
    --locale="fr_FR" \
    --path='/var/www/wordpress'
