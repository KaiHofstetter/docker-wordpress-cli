#!/bin/sh

./config_mysql.sh
./config_wordpress.sh

echo "=> Starting Apache..."
/usr/sbin/apache2ctl -D FOREGROUND
