#!/bin/sh

if ! $(wp core is-installed  --allow-root --path='/var/www/html'); then
   echo "=> WordPress is not configured yet, configuring WordPress ..."

   echo "=> Installing WordPress"
   sudo -E -u www-data wp core install --path='/var/www/html' --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
else
   echo "=> WordPress is alread configured.";
fi


