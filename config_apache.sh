#!/bin/bash

if [ ! -f /apache_configured ]; then
    echo "=> Apache is not configured yet, configuring Apache ..."
    echo "=> Setting ServerName"
    echo "ServerName localhost" >> /etc/apache2/conf-available/fqdn.conf
    a2enconf fqdn > /dev/null 2>&1

    touch /apache_configured
else
    echo "=> Apache is already configured"
fi