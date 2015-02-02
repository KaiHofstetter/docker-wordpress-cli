FROM ubuntu:14.10
MAINTAINER Kai Hofstetter <kai.hofstetter@gmx.de>

# Install lamp stack plus curl
RUN apt-get update && \
    apt-get -y install apache2 libapache2-mod-php5 php5 php5-mysql mysql-server curl

# Install WordPress
RUN curl -L "https://github.com/WordPress/WordPress/archive/4.1.tar.gz" > /wp-4.1.tar.gz && \
    rm /var/www/html/index.html && \
    tar -xzf /wp-4.1.tar.gz -C /var/www/html --strip-components=1 && \
    rm /wp-4.1.tar.gz
 
# Download WordPress CLI
RUN curl -L "https://github.com/wp-cli/wp-cli/releases/download/v0.17.1/wp-cli.phar" > /usr/bin/wp && \
    chmod +x /usr/bin/wp

# WordPress configuration
ADD wp-config.php /var/www/html/wp-config.php

# Apache access
RUN chown -R www-data:www-data /var/www/html

# Start MySQL and create WordPress DB 
RUN /etc/init.d/mysql start && \
    mysqladmin create wordpress

# Configure WordPress
RUN /etc/init.d/mysql start && \ 
    wp core install --path='/var/www/html' --allow-root --url='localhost' --title='WordPress Demo' --admin_user='admin' --admin_password='secret' --admin_email='test@test.com'

# Add configuration script
ADD start_apache.sh /start_apache.sh
RUN chmod 755 /*.sh

EXPOSE 80 
CMD ["/start_apache.sh"]
