# WordPress Bareboner

This is simply a model repo for a WordPress site, originally forked from Mark Jaquith's [WordPress-Skeleton](https://github.com/markjaquith/WordPress-Skeleton). It also provides a maintenance version of your site which you can switch to when you need your WordPress instance to go offline, and a Bash library containing common backup tasks for your files and database. Use it to jump-start your WordPress site repos, or fork it and customize it to your own liking!

**Current stable version**: [1.2](https://github.com/andrezrv/wordpress-bareboner/tree/1.2)

### What's different from a default WordPress installation?

* WordPress is included as a Git submodule in `/app/wordpress/`. Keep in mind that you can't include any non-core files here.
* You're gonna be using a custom content directory in `/app/content/` (cleaner, and also because it can't be in `/app/wordpress/`).
* Your `wp-config.php` file is in `/app/` (because it can't be in `/app/wordpress/`).
* All writable directories are symlinked to similarly named locations under `/shared/`.

All of these changes will significantly improve your WordPress core update process, since you're not gonna be able to overwrite or delete your content accidentally when updating. It's also a cleaner way to mantain your custom files (themes, plugins and static assets) separated from the core, because you can easily move them to any other installation or version of WordPress without dealing with any core files that could be on your way.

### Assumptions

* You are developing and staging against Unix systems. Windows is not supported, since this project contains symlinks and Bash tasks that will not work there. For local development, you may want to consider using [Vagrant](http://www.vagrantup.com/) and [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).
* You have a symlink called `/live` that points either to `/app/` or `/app/wordpress/` (the later is the default path).
* You have a symlink called `/background` that points to `/app/maintenance/`.
* You are pointing the root of your host in your NGINX or Apache configuration to `/live`, as you can see in `/app/nginx-sample.conf`.

### Getting started

#### Cloning
You must clone this repository recursively, because it includes WordPress as a Git submodule and you won't get all the files with a default clone. Just run the following command:

```bash
git clone --recursive git://github.com/andrezrv/wordpress-bareboner.git $my_project
```
#### WordPress Version
This repo intends to always track the latest stable release. Please send a pull request if I fall behind.

#### Uploads Management
For local development, `/app/shared/` will contain your static files, which will be ignored by Git, because probably you don't wish to have some of them outside your development stage. For production and staging, you would need your deploy script (i.e some Capistrano-based library, such as [Stage WP](http://github.com/andrezrv/stage-wp), ) or [WP-Stack](http://github.com/markjaquith/WP-Stack)) to look for symlinks pointing to `/shared/` and repoint them to some location outside the repo. This gives you separation between Git-managed code and uploaded files. However, if you're using [Stage WP](http://github.com/andrezrv/stage-wp), it provides tasks that can help you deploy your static files in separated processes.

#### Local Configuration
For local development, copy `local-config-sample.php` to `local-config.php` and configure your settings there. Locally, you may need to have different MySQL credentials or do things like enable query saving or debug mode. This file is ignored by Git, so it doesn't accidentally get checked in. If the file does not exist (which it shouldn't, both in production and staging), then WordPress will use the database credentials defined in `wp-config.php`.

#### Production & Staging Configuration
For production, copy `production-config-sample.php` to `production-config.php`; for staging, copy `staging-config-sample.php` to `staging-config.php`. Those file should contain settings that you only want to be active on each environment. `production-config.php` should not exist on your staging environment. To achieve this, since the file is not ignored by Git, you need to ignore it in your deploy script, or remove it from your staging server before finishing deployment.

#### Using Cache
If you want to use [Memcached](http://wordpress.org/plugins/memcached/) as an object cache backend, or any other cache plugin or method that you need to configure within a file, such as [APC](http://wordpress.org/plugins/apc/) or [Batcache](http://wordpress.org/plugins/batcache/), copy `cache-config-sample.php` to `cache-config.php`. The included code works only for Batcache, but you can modify it as you need. For memcached, it should be something like: `<?php return array( "server01:11211", "server02:11211" ); ?>`.

#### Using WP-CLI
If you're using [WP-CLI](http://wp-cli.org/) (and if not, you really should), just copy `wp-cli-sample.yml` and `wp-cli.yml` and adjust it to your own needs. Be sure to point `path` to `/app/wordpress/`, since this file can't be into `/app/wordpress/`.

#### Database Settings in `wp-config.php`
If you are using [WP-Stack](http://github.com/markjaquith/WP-Stack) or [Stage WP](http://github.com/andrezrv/stage-wp) as your deployment script, in the moment you fire your deploy process, both of these tools will automatically set the database values to the ones you defined in their configuration files, so you should never write them down on `wp-config.php`. Otherwise, you should write your own deployment script to do so, or add `wp-config.php` to your `.gitignore` file to avoid sending your credentials to your remote repo.

#### Using Maintenance Mode
Just repoint the root of your NGINX server to `{path_to_this_repo}/maintenance`.

#### Support for [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV)
Edit the files inside the `vvv` folder so your site can load automatically upon `vagrant up`.

#### Support For Multisite Mode
WordPress fully supports Mulstise Mode since WordPress 3.5. Earlier versions of WordPress don't support Multisite when WordPress is in a subdirectory, but if your site is not the case, you should not have problems with older versions.

### Must Use Plugins
WordPress Must Use plugins, typically included in `mu-plugins` folder, are plugins that don't need to be activated and will work just because of being there. WordPress Bareboner includes some of those plugins:

#### Recover Default Theme Directory
For installations with a custom content directory, it registers again the default one, located in `wp-content/themes`, so you can use the default themes pre-installed in every WordPress release. Original credits go to [Mark Jaquith](https://github.com/markjaquith/WordPress-Skeleton).

#### Jetpack Development Mode
If you're using [Jetpack](http://jetpack.me/) and have not defined the `JETPACK_DEV_DEBUG` constant, this plugin will automatically set Jetpack to [Development Mode](http://jetpack.me/support/development-mode/) for your local stage.

#### Jetpack Modules Deactivator
By default, upon its installation, [Jetpack](http://jetpack.me/) will activate a lot of modules that may go from being a little annoying to add a lot of overhead to your site loading speed. This plugin will set the status of all the Jetpack modules upon installation to deactivated by default.

### Contributing
If you feel like you want to help this project by adding something you think useful, you can make your pull request against the master branch :)
