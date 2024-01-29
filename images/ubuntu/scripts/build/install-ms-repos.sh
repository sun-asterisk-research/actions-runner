#!/bin/bash -e
################################################################################
##  File:  install-ms-repos.sh
##  Desc:  Install official Microsoft package repos for the distribution
################################################################################

os_label=$(lsb_release -rs)

# update
apt-get install -y apt-transport-https ca-certificates curl unzip software-properties-common
apt-get -yq update
apt-get -yq dist-upgrade

apt-get install -y wget

# Install Microsoft repository
wget https://packages.microsoft.com/config/ubuntu/$os_label/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb