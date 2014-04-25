#!/bin/sh

# set MySQL language
MYSQL_LANG=/etc/mysql/conf.d/lang.cnf
tee ${MYSQL_LANG} << _EOL_
[mysqld]
character-set-server = utf8mb4
[mysql]
default-character-set = utf8mb4
_EOL_

# Restart MySQL
service mysql restart
