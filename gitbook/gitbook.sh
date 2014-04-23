#!/bin/sh

apt-get update
apt-get install -y git curl fonts-ipafont
apt-get install -y -t wheezy-backports nodejs nodejs-legacy calibre
apt-get purge -y fonts-droid
curl https://www.npmjs.org/install.sh | sudo clean=no sh
npm install gitbook -g
npm install gitbook-pdf -g
