<?php
/**
 * Jetpack Modules Deactivator
 *
 * If you're using Jetpack, this plugin will set the status of all its modules
 * to deactivated by default. 
 *
 * @package   Jetpack_Modules_Deactivator
 * @author    Andrés Villarreal <andrezrv@gmail.com>
 * @license   GPL2
 * @link      http://github.com/andrezrv/wordpress-bareboner/
 * @copyright 2014 Andrés Villarreal
 *
 * @wordpress-plugin
 * Plugin name: Jetpack Modules Deactivator
 * Plugin URI: http://github.com/andrezrv/wordpress-bareboner/
 * Description: If you're using Jetpack, this plugin will set the status of all its modules to deactivated by default. 
 * Author: Andrés Villarreal
 * Author URI: http://about.me/andrezrv
 * Version: 1.0
 * License: GPL2
 */
add_filter( 'jetpack_get_default_modules', '__return_empty_array' );
