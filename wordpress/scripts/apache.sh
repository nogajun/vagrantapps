#!/bin/sh

# Setup Apache VirtualHost 
APACHE_WORDPRESS=/etc/apache2/sites-available/wordpress
tee ${APACHE_WORDPRESS} << _EOL_
NameVirtualHost *:80

<VirtualHost *:80>
  ServerName wp.local
  DocumentRoot /srv/wordpress/
  DirectoryIndex index.php index.html
  ErrorLog /var/log/apache2/wp-error.log
  TransferLog /var/log/apache2/wp-access.log
</VirtualHost>
_EOL_

# Enable VirtualHost
a2dissite default
a2ensite wordpress

# Enable Apache modules
a2enmod rewrite vhost_alias

# Restart Apache2
service apache2 restart
