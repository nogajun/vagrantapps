#!/bin/sh

# Install wp-cli
WPCLI=/usr/local/bin/wp
WPCLI_URL=https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
wget -O ${WPCLI} ${WPCLI_URL}
chmod 755 ${WPCLI}

# Make WordPress Directory
WP_INSTALL=/srv/wordpress
if [ ! -d "${WP_INSTALL}" ]; then
  mkdir ${WP_INSTALL}
  chown www-data:www-data ${WP_INSTALL}
fi

# Install WordPress
WP_URL=wp.local
WP_TITLE="wp.local"
WP_ADMIN_NAME=admin
WP_ADMIN_PASS=admin
WP_ADMIN_MAIL=example@example.com

sudo -u www-data sh <<_EOL_
  cd ${WP_INSTALL}
  wp core download --locale=ja
  wp core config --dbname=wordpress --dbuser=root --dbpass=root
  wp db create
  wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_name=${WP_ADMIN_NAME} --admin_email=${WP_ADMIN_MAIL} --admin_password=${WP_ADMIN_PASS}
  wp plugin activate wp-multibyte-patch
_EOL_

# Copy wordpress
rsync -auvW ${WP_INSTALL}/ /vagrant/wordpress/
