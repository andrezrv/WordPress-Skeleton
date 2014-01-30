<?php
/**
 * WordPress view bootstrapper.
 * 
 * Bootstrap WordPress for installations of WordPress as a subdirectory.
 */
define( 'WP_USE_THEMES', true );
require( dirname( __FILE__ ) . '/wordpress/wp-blog-header.php' );
