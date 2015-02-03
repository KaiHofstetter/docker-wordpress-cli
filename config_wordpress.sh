#!/bin/sh

echo "=> Checking if WordPress is already configured..."
if ! $(wp core is-installed  --allow-root --path='/var/www/html'); then
   echo "=> WordPress is not configured yet, configuring WordPress..."
   wp core install --path='/var/www/html' --allow-root --url='localhost' --title='WordPress Demo' --admin_user='admin' --admin_password='secret' --admin_email='test@test.com'
else
   echo "=> WordPress is alread configured.";
fi


