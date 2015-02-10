#!/bin/sh

echo "=> Checking if MySQL is already configured..."

echo "=> Creating WordPress db"
mysqladmin create wordpress

echo "=> Setting MySQL bind address to have access from the Docker host"
sed -i 's/^bind-address\s*=.*$/bind-address = "0.0.0.0"/' /etc/mysql/my.cnf

echo "=> Creating MySQL WP user and granting external access";
mysql -uroot -e "CREATE USER '$MYSQL_WP_USER'@'%' IDENTIFIED BY '$MYSQL_WP_PASSWORD';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_WP_USER'@'%' WITH GRANT OPTION;"

echo "=> Stopping MySQL"
#/etc/init.d/mysql stop;
mysqladmin -uroot shutdown

echo "=> Starting MySQL"
/etc/init.d/mysql start;