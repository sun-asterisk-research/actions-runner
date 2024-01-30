#!/bin/bash -e
################################################################################
##  File:  install-apache.sh
##  Desc:  Install Apache HTTP Server
################################################################################

# Install Apache
apt-get install apache2 systemd -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"

