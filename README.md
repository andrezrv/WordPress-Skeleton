# WordPress Bareboner

This is simply a model repo for a WordPress site, originally forked from Mark Jaquith's [WordPress-Skeleton](https://github.com/markjaquith/WordPress-Skeleton). It also provides a maintenance version of your site which you can switch to when you need your WordPress to go offline, and a Bash library containing common backup tasks for your files and database. Use it to jump-start your WordPress site repos, or fork it and customize it to your own liking!

## What's different from a default WordPress installation?

* WordPress is included as a Git submodule in `/app/wordpress/`.
* You're gonna be using a custom content directory in `/app/content/` (cleaner, and also because it can't be in `/app/wordpress/`).
* Your `wp-config.php` file is in `/app/` (because it can't be in `/app/wordpress/`).
* All writable directories are symlinked to similarly named locations under `/shared/`.

All of these changes will significantly improve your WordPress core update process, since you're not gonna be able to overwrite or delete your content accidentally when updating. It's also a cleaner way to mantain your custom files (themes, plugins and static assets) separated from the core, because you can easily move them to any other installation or version of WordPress without dealing with any core files that could be on your way.

## Assumptions

* You have a symlink called `/live` that points either to `/app/` or `/app/wordpress/`.
* You have a symlink called `/background` that points to `/app/maintenance/`.
* You pointed the root of your host in your NGINX or Apache configuration to `/live`.

## Questions & Answers

**Q:** Why the `/app/shared/` symlink stuff for uploads?
**A:** For local development, create `/app/shared/` (it is ignored by Git), and have the files live there. For production and staging, have your deploy script (Capistrano is my choice) look for symlinks pointing to `/shared/` and repoint them to some outside-the-repo location (like an NFS shared directory or something). This gives you separation between Git-managed code and uploaded files.

**Q:** What version of WordPress does this track?  
**A:** The latest stable release. Please send a pull request if I fall behind.

**Q:** What's the deal with `local-config.php`?  
**A:** It is for local development, which might have different MySQL credentials or do things like enable query saving or debug mode. This file is ignored by Git, so it doesn't accidentally get checked in. If the file does not exist (which it shouldn't, both in production and staging), then WordPress will use the database credentials defined in `wp-config.php`.

**Q:** And what about `production-config.php` and `staging-config.php`?
**A:** They should contain settings that you only want to be active on each environment. `production-config.php` should not exist on your staging environment. To achieve this, since the file is not ignored by Git, you need to ignore it in your deploy script, or remove it from your staging server before finishing deployment.

**Q:** What is `cache-config.php`?
**A:** This is for people using [Memcached](http://wordpress.org/plugins/memcached/) as an object cache backend, or any other cache plugin or method that you need to configure within a file, such as [APC](http://wordpress.org/plugins/apc/) or [Batcache](http://wordpress.org/plugins/batcache/). For memcached, it should be something like: `<?php return array( "server01:11211", "server02:11211" ); ?>`. Programattic generation of this file is recommended.

**Q:** What should I do with database settings in `wp-config.php`?
**A:** If you are using [WP-Stack](http://github.com/markjaquith/WP-Stack) or [Stage WP](http://github.com/andrezrv/stage-wp) as your deployment script, in the moment you fire your deploy process, both of these tools will automatically set the database values to the ones you defined in their configuration files, so you should never write them down on `wp-config.php`. Otherwise, you should write your own deployment script to do so, or add `wp-config.php` to your `.gitignore` file to avoid sending your credentials to your remote repo.

**Q:** How do I activate the backup tasks?
**A:** Copy `/app/tasks/config.example.cfg` to `/app/tasks/config.cfg`, fill it with your custom values and run `bash add-to-bin.sh`. That will give you the following terminal commands:

* `${website}-backup-application`: saves a copy of your website files into your desired location. You should add its path to your `.gitignore` if you are saving the files inside the repo's folder.
* `${website}-backup-database`: saves a copy of your database into your desired location. As with the former task, you should add its path to your `.gitignore` if you are saving the files inside the repo's folder.
* `${website}-switch`: switches your website from live to maintenance state and vice versa, by tweaking symlinks to your site's root.
* `${website}-full-backup`: puts your website in maintenance state, then performs a full backup of database and files, and puts your site in live state again.

**Q:** Does this support WordPress in Multisite mode?
**A:** It fully does since WordPress 3.5. Earlier versions of WordPress don't support Multisite when WordPress is in a subdirectory, but if your site is not the case, you should not have problems with older versions.
