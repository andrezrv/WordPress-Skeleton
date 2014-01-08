<?php
/**
 * This is a sample local-config.php file
 * In it, you *must* include the four main database defines
 * 
 * You may include other settings here that you only want enabled on your local development checkouts
 */

// ==================
// Load database info
// ==================
define( 'DB_NAME', 'local_db_name' );
define( 'DB_USER', 'local_db_user' );
define( 'DB_PASSWORD', 'local_db_password' );
define( 'DB_HOST', 'localhost' ); // Probably 'localhost'

// ==============
// Debug settings
// ==============
ini_set( 'display_errors', 0 ); // Set this to 1 if you want to see the whole bunch of PHP errors.
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', true );
