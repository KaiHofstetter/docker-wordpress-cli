<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', getenv('MYSQL_WP_USER'));

/** MySQL database password */
define('DB_PASSWORD', getenv('MYSQL_WP_PASSWORD'));

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '^D+;80Q6#e$kASuq3_}rLJ^8ShYp9))LIi6tp+p$r NI-0YCMa-eqH]U1)-L`cu.');
define('SECURE_AUTH_KEY',  'vCIr9-?7M4Zj}B^!W:-VF-G`*kcgd+f<Ou43-Q?-YftV}h+7i:a )`3V0++)+xxo');
define('LOGGED_IN_KEY',    'WOS_E&/uMB{cF;gl-&kUX&xn^r!C=Og&TPh?Yu/A`?[E&`>c<%66J+Pi *ziKWRe');
define('NONCE_KEY',        ' sow+EOT~q-Ps(9<!/Fev<{;0`gNmF^)>=JSJSHwK9VURc-?&tyNAr#zvA6I5<U+');
define('AUTH_SALT',        'MGKp{A$>iBa1U;_F+uwzQQG|5XQj]D2_Zd5* @nWY-Oht&QR@]d>gbfak-[/0+OA');
define('SECURE_AUTH_SALT', 'Ahn*Ye#AMEmj((o)>,CH-|C2oTI8E;GPK?7qi!f 8)!DJ(WM(]ncGyTJS351`G2@');
define('LOGGED_IN_SALT',   'M!E82u3kZ-TyLX=UPfG>PBP8e^2.j>9qx%P;P=/h+^zO+~Y~>e1IqCgwNJin4G(k');
define('NONCE_SALT',       ']gHcK26tPBhP+^5Z~>Y^7W++2{Q3l:7>KAbzyqWa&1nF,4!%I5G/RySidv#s8b,9');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

