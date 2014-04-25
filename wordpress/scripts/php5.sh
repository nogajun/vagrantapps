#!/bin/sh

# set upload size
PHPINI=/etc/php5/apache2/php.ini
sed -i 's/^memory_limit =.*$/memory_limit = 128M/g' ${PHPINI}
sed -i 's/^post_max_size =.*$/post_max_size = 50M/g' ${PHPINI}
sed -i 's/^upload_max_filesize =.*$/upload_max_filesize = 50M/g' ${PHPINI}

# setup php5-apc
APCINI=/etc/php5/mods-available/apc.ini
tee ${APCINI} << _EOL_
apc.enabled=1
apc.shm_size=30
_EOL_
