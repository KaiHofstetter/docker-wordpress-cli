#!/bin/sh

echo "=> starting MySQL..."
/etc/init.d/mysql start

echo "=> starting Apache..."
/usr/sbin/apache2ctl -D FOREGROUND

