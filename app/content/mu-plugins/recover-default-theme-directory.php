<?php
/**
 * Recover Default Theme Directory
 *
 * For installations with a custom content directory, it registers again the 
 * default one, located in <code>wp-content/themes</code>, so you can use the 
 * default themes pre-installed in every WordPress release.
 *
 * Original credits go to Mark Jaquith: {@link http://github.com/markjaquith/WordPress-Skeleton}
 *
 * @package   Recover_Default_Theme_Directory
 * @author    Andrés Villarreal <andrezrv@gmail.com>
 * @license   GPL2
 * @link      http://github.com/andrezrv/wordpress-bareboner/
 * @copyright 2014 Andrés Villarreal
 *
 * @wordpress-plugin
 * Plugin name: Recover Default Theme Directory
 * Plugin URI: http://github.com/andrezrv/wordpress-bareboner/
 * Description: For installations with a custom content directory, it registers again the default one, located in <code>wp-content/themes</code>, so you can use the default themes pre-installed in every WordPress release. Original credits go to <a href="https://github.com/markjaquith/WordPress-Skeleton">Mark Jaquith</a>.
 * Author: Andrés Villarreal
 * Author URI: http://about.me/andrezrv
 * Version: 1.0
 * License: GPL2
 */
register_theme_directory( ABSPATH . 'wp-content/themes/' );
