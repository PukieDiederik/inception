#!/bin/bash

wp core install --title="wp_site"\
    --url="https://drobert-.42.fr"\
    --admin_user="$WP_ADMIN_NAME"\
    --admin_password="$WP_ADMIN_PASS"\
    --admin_email="$WP_ADMIN_EMAIL"\
    --skip-email\
    --allow-root\
    --path="/var/www/wordpress"

# wp config list --allow-root
# echo $WP_DB_NAME
# ping mariadb:3306

php-fpm8 -F -y /etc/php8/php-fpm.conf