#!/bin/sh

echo "=> Checking if WordPress is already configured..."
if ! $(wp core is-installed  --allow-root --path='/var/www/html'); then
   echo "=> WordPress is not configured yet, configuring WordPress...: " $WP_TITLE
   wp core install --path='/var/www/html' --allow-root --url='localhost' --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
else
   echo "=> WordPress is alread configured.";
fi


