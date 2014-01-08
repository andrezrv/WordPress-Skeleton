<?php
/**
 * This is a sample local-config.php file
 * In it, you must include the four main database defines
 * 
 * You may include other settings here that you only want enabled on your local development checkouts
 */

// ** MySQL settings - By now you should know were to get this from ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'local_db_name' );

/** MySQL database username */
define( 'DB_USER', 'local_db_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'local_db_password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' ); // Probably 'localhost'

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/**
 * Debug settings.
 *
 * It's recommended to have WP_DEBUG and WP_DEBUG_DISPLAY set to true on your
 * local environment, so you can tell if something goes wrong. On the other
 * hand, setting display_errors to 1 may show a lot of PHP errors, depending on
 * your code and your PHP configuration, and that's why is set to 0 by default.
 */
ini_set( 'display_errors', 0 ); // Set this to 1 if you want to see the whole bunch of PHP errors.
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', true );
