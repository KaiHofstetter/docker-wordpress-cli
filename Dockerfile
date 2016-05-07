FROM ubuntu:14.04
MAINTAINER Kai Hofstetter <kai.hofstetter@gmx.de>

# Install lamp stack plus curl
RUN apt-get update && \
    apt-get -y install apache2 libapache2-mod-php5 php5 php5-mysql mysql-server curl

# Download WordPress
RUN curl -L "https://wordpress.org/wordpress-4.5.2.tar.gz" > /wordpress-4.5.2.tar.gz && \
    rm /var/www/html/index.html && \
    tar -xzf /wordpress-4.5.2.tar.gz -C /var/www/html --strip-components=1 && \
    rm /wordpress-4.5.2.tar.gz
 
# Download WordPress CLI
RUN curl -L "https://github.com/wp-cli/wp-cli/releases/download/v0.23.1/wp-cli-0.23.1.phar" > /usr/bin/wp && \
    chmod +x /usr/bin/wp

# WordPress configuration
ADD wp-config.php /var/www/html/wp-config.php

# Apache access
RUN chown -R www-data:www-data /var/www/html
    
# Add configuration script
ADD config_and_start_mysql.sh /config_and_start_mysql.sh
ADD config_apache.sh /config_apache.sh
ADD config_wordpress.sh /config_wordpress.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# MySQL environment variables
ENV MYSQL_WP_USER WordPress
ENV MYSQL_WP_PASSWORD secret

# WordPress environment variables
ENV WP_URL localhost
ENV WP_TITLE WordPress Demo
ENV WP_ADMIN_USER admin_user
ENV WP_ADMIN_PASSWORD secret
ENV WP_ADMIN_EMAIL test@test.com

EXPOSE 80 3306
CMD ["/run.sh"]
