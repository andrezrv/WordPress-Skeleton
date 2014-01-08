<?php
/**
 * This is a sample staging-config.php file.
 * 
 * You may include here any settings that you only want enabled on your staging environment.
 */

/**
 * Debug settings.
 *
 * While WP_DEBUG and WP_DEBUG_DISPLAY are not really needed to be specified on
 * your staging environment, one can never be cautious enough. On the other
 * hand, setting display_errors to 0 prevents your visitors from viewing any
 * possible PHP error in any of your WordPress pages.
 */
ini_set( 'display_errors', 0 );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_DISPLAY', false );

/**
 * Automatic updates settings.
 *
 * Since version 3.7 WordPress automatically updates to new minor versions.
 * This could not be desireable if you are working on your own controlled and
 * often mantained repository. The updating process can be disabled by
 * setting to false the value of the WP_AUTO_UPDATE_CORE constant.
 */
define( 'WP_AUTO_UPDATE_CORE', false );

/**
 * Edit files in WordPress admin.
 *
 * By default, WordPress allow administrators to edit plugin and theme files
 * from the WordPress dashboard. This could be an important security issue in
 * case someone puts his hands on your admin privileges and gains access to the
 * admin area. The file editing capability can be disabled by setting to false
 * the values of both DISALLOW_FILE_EDIT and DISALLOW_FILE_MODS constants.
 */
define( 'DISALLOW_FILE_EDIT', true );
define( 'DISALLOW_FILE_MODS', true );
