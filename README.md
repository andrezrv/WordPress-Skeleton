# WordPress Bareboner

This is simply a model repo for a WordPress site, originally forked from Mark Jaquith's [WordPress-Skeleton](https://github.com/markjaquith/WordPress-Skeleton). It also provides a maintenance version of your site which you can switch to when you need your WordPress instance to go offline, and a Bash library containing common backup tasks for your files and database. Use it to jump-start your WordPress site repos, or fork it and customize it to your own liking!

**Current stable version**: [1.1](https://github.com/andrezrv/wordpress-bareboner/tree/1.1)

### What's different from a default WordPress installation?

* WordPress is included as a Git submodule in `/app/wordpress/`. Keep in mind that you can't include any non-core files here.
* You're gonna be using a custom content directory in `/app/content/` (cleaner, and also because it can't be in `/app/wordpress/`).
* Your `wp-config.php` file is in `/app/` (because it can't be in `/app/wordpress/`).
* If you're using WP-CLI, your `wp-cli.yml` file will be in `/app/`, because of the former reasons.
* All writable directories are symlinked to similarly named locations under `/shared/`.

All of these changes will significantly improve your WordPress core update process, since you're not gonna be able to overwrite or delete your content accidentally when updating. It's also a cleaner way to mantain your custom files (themes, plugins and static assets) separated from the core, because you can easily move them to any other installation or version of WordPress without dealing with any core files that could be on your way.

### Assumptions

* You are developing and staging against Unix systems. Windows is not supported, since this projects contains symlinks and Bash tasks that will not work there. For local development, you may want to consider using [Vagrant](http://www.vagrantup.com/) and [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).
* You have a symlink called `/live` that points either to `/app/` or `/app/wordpress/` (the later is the default path).
* You have a symlink called `/background` that points to `/app/maintenance/`.
* You are pointing the root of your host in your NGINX or Apache configuration to `/live`, as you can see in `/app/nginx-sample.conf`.

### Getting started

##### Cloning
You must clone this repository recursively, because it includes WordPress as a Git submodule and you won't get all the files with a default clone. Just run the following command:

```bash
git clone --recursive git://github.com/andrezrv/wordpress-bareboner.git $my_project 
```

##### Contributing
If you feel like you want to help this project by adding something you think useful, you can make your pull request against the master branch :)

### Questions & Answers

#### Why the `/app/shared/` symlink stuff for uploads?
For local development, `/app/shared/` will contain your static files, which will be ignored by Git, because probably you don't wish to have some of them outside your development stage. For production and staging, you would need your deploy script (i.e some Capistrano-based library, such as [Stage WP](http://github.com/andrezrv/stage-wp), ) or [WP-Stack](http://github.com/markjaquith/WP-Stack)) to look for symlinks pointing to `/shared/` and repoint them to some location outside the repo. This gives you separation between Git-managed code and uploaded files. However, if you're using [Stage WP](http://github.com/andrezrv/stage-wp), it provides tasks that can help you deploy your static files in separated processes.

#### What version of WordPress does this track?
The latest stable release. Please send a pull request if I fall behind.

#### What's the deal with `local-config.php`?
It is for local development, which might have different MySQL credentials or do things like enable query saving or debug mode. This file is ignored by Git, so it doesn't accidentally get checked in. If the file does not exist (which it shouldn't, both in production and staging), then WordPress will use the database credentials defined in `wp-config.php`.

#### And what about `production-config.php` and `staging-config.php`?
They should contain settings that you only want to be active on each environment. `production-config.php` should not exist on your staging environment. To achieve this, since the file is not ignored by Git, you need to ignore it in your deploy script, or remove it from your staging server before finishing deployment.

#### What is `cache-config.php`?
This is for people using [Memcached](http://wordpress.org/plugins/memcached/) as an object cache backend, or any other cache plugin or method that you need to configure within a file, such as [APC](http://wordpress.org/plugins/apc/) or [Batcache](http://wordpress.org/plugins/batcache/). For memcached, it should be something like: `<?php return array( "server01:11211", "server02:11211" ); ?>`.

#### What should I do about `wp-cli.yml`?
If you're using [WP-CLI](http://wp-cli.org/) (and if not, you really should), just copy `wp-cli-sample.yml` and `wp-cli.yml` and adjust it to your own needs. Be sure to point `path` to `/app/wordpress/`, since this file can't be into `/app/wordpress/`.

#### What should I do with database settings in `wp-config.php`?
If you are using [WP-Stack](http://github.com/markjaquith/WP-Stack) or [Stage WP](http://github.com/andrezrv/stage-wp) as your deployment script, in the moment you fire your deploy process, both of these tools will automatically set the database values to the ones you defined in their configuration files, so you should never write them down on `wp-config.php`. Otherwise, you should write your own deployment script to do so, or add `wp-config.php` to your `.gitignore` file to avoid sending your credentials to your remote repo.

#### How do I activate the backup tasks?
Copy `/app/tasks/config-sample.sh` to `/app/tasks/config.sh`, fill it with your custom values and run `bash add-to-bin.sh`. That will give you the following terminal commands:

* `${your_prefix}-backup-application`: saves a copy of your website files into your desired location. You should add its path to your `.gitignore` if you are saving the files inside the repo's folder.
* `${your_prefix}-backup-database`: saves a copy of your database into your desired location. As with the former task, you should add its path to your `.gitignore` if you are saving the files inside the repo's folder.
* `${your_prefix}-switch`: switches your website from active to maintenance state and vice versa, by switching symlinks to your site's root.
* `${your_prefix}-full-backup`: puts your website in maintenance state, then performs a full backup of database and files, and puts your site in active state again.

#### Does this support WordPress in Multisite mode?
It fully does since WordPress 3.5. Earlier versions of WordPress don't support Multisite when WordPress is in a subdirectory, but if your site is not the case, you should not have problems with older versions.
