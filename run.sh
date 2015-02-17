#!/bin/sh

./config_and_start_mysql.sh
./config_wordpress.sh

echo "=> Starting Apache..."
/usr/sbin/apache2ctl -D FOREGROUND
