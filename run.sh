#!/bin/sh

./config_and_start_mysql.sh
./config_apache.sh
./config_wordpress.sh

echo "=> Apache started..."
/usr/sbin/apache2ctl -D FOREGROUND
