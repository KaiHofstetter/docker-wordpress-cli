# docker-wordpress-cli
WordPress Docker image bundled with MySQL and WordPress CLI. Installs an automatically configured and ready to use WordPress.

Everything needed to run WordPress is included in the image and no manual configuration is needed. This image is perfect for (automated) testing and development.

The MySQL database is accessible from the host. 

## How to use it
1. Run WordPress

    ```
    docker run --name my-wordpress -p 80:80 -d kaihofstetter/wordpress-cli
    ```
2. Access WordPress

    ```
    http://localhost
    ```

2. Log in to WordPress

    ```
    http://localhost/wp-login.php
    ```

    Username: 'admin_user'
    
    Password: 'secret'

### Accessing the MySQL database
Run WordPress with mapped MySQL port 3306:

```
docker run --name my-wordpress -p 80:80 -p 3306:3306 -d kaihofstetter/wordpress-cli
```

The MySQL database is accessible via ```port 3306```, ```user: WordPress``` and ```password: secret```.

### Executing WP CLI commands
The included WordPress command line interpreter (WP CLI) can be executed via ```docker exec```:

``` 
docker exec -i -t my-wordpress wp ...
```

For more information about WP CLI commands : [http://wp-cli.org/commands/](http://wp-cli.org/commands/)

###  Environment variables
You can use the following environment variables to configure MySQL and WordPress

* **MYSQL_WP_USER** (default is 'WordPress')
  * MySQL user, used by WordPress
* **MYSQL_WP_PASSWORD** (default is 'secret')
  * MySQL password, used by WordPress
* **WP_TITLE** (default is 'WordPress Demo')
  * Title of the WordPress blog
* **WP_ADMIN_USER** (default is 'admin_user')
  * WordPress admin user
* **WP_ADMIN_PASSWORD** (default is 'secret”)
  * WordPress admin password
* **WP_ADMIN_EMAIL** (default is 'test@test.com')
  * WordPress admin email address (WordPress installation does not send emails!)
