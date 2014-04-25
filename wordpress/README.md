WordPress
=========
Installing WordPress to Debian/Wheezy box.

How to use
----------

1. Install WordPress to Box When You Run "vagrant up"

    $ vagrant up

2. see http://wp.local/ your web browaser

- WordPress: http://wp.local/
- WordPress Dashboard: http://wp.local/wp-admin/
- PHPMyAdmin: http://wp.local/phpmyadmin/

ID/Password
-----------

- WordPress: admin/admin
- PHPMyAdmin(MySQL): root/root

Synced Folder
-------------

./wordpress/ folder syncronized /srv/wordpress/ at box.
If automatically synchronized folders, please run "vagrant rsync-auto"

