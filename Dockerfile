FROM tutum/wordpress:latest
MAINTAINER Kai Hofstetter <kai.hofstetter@gmx.de>

# Install curl
RUN apt-get update && \
    apt-get -y install curl

# Download WordPress CLI
RUN curl -L "https://github.com/wp-cli/wp-cli/releases/download/v0.17.1/wp-cli.phar" > /usr/bin/wp && \
    chmod +x /usr/bin/wp

# Add configuration script
ADD run_wordpress_cli.sh /run_wordpress_cli.sh
RUN chmod 755 /*.sh

EXPOSE 80 3306 
CMD ["/run_wordpress_cli.sh"]
