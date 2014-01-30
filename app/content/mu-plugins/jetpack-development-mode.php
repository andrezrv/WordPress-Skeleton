<?php
/**
 * Jetpack Development Mode
 *
 * If you're using Jetpack, this plugin will automatically manage its
 * development mode for your local stage.
 *
 * @package   Jetpack_Development_Mode
 * @author    Andrés Villarreal <andrezrv@gmail.com>
 * @license   GPL2
 * @link      http://github.com/andrezrv/wordpress-bareboner/
 * @copyright 2014 Andrés Villarreal
 *
 * @wordpress-plugin
 * Plugin name: Jetpack Development Mode
 * Plugin URI: http://github.com/andrezrv/wordpress-bareboner/
 * Description: If you're using Jetpack, this plugin will automatically manage its development mode for your local stage.
 * Author: Andrés Villarreal
 * Author URI: http://about.me/andrezrv
 * Version: 1.0
 * License: GPL2
 */
if (   ( defined( 'JETPACK_DEV_DEBUG' ) && true === JETPACK_DEV_DEBUG )
	|| ( defined( 'WP_LOCAL_DEV' ) && true === WP_LOCAL_DEV ) 
) {
	add_filter( 'jetpack_development_mode', '__return_true' );
}
