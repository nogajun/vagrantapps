#!/bin/sh

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

# Update sources
apt-get -q update

# set debconf mysql-server phpmyadmin
debconf-set-selections <<_EOL_
mysql-server-5.5 mysql-server/root_password password root
mysql-server-5.5 mysql-server/root_password_again password root
phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin phpmyadmin/dbconfig-install boolean true
phpmyadmin phpmyadmin/mysql/admin-pass password root
phpmyadmin phpmyadmin/mysql/app-pass password
_EOL_

# install packages
apt-get -y -q install apache2 mysql-server php5 curl git less php-apc mysql-client phpmyadmin libphp-phpmailer libphp-snoopy exim4 ufw
