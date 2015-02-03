#!/bin/sh

echo "=> Starting MySQL..."
/etc/init.d/mysql start

./config_wordpress.sh

echo "=> Starting Apache..."
/usr/sbin/apache2ctl -D FOREGROUND
