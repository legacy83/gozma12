#!/bin/sh

###########################################################
# System Update
###########################################################

apt-get -y update
apt-get -y upgrade

###########################################################
# System Locale
###########################################################

apt-get -y install language-pack-en
apt-get -y install language-pack-pt
echo "LANG=en_US.UTF-8" > /etc/default/locale
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale

locale-gen en_US.UTF-8
dpkg-reconfigure locales

###########################################################
# System Timezone
###########################################################

echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

###########################################################
# Good Stuff
###########################################################

apt-get -y install sqlite
apt-get -y install wget curl
apt-get -y install subversion git-core
apt-get -y install imagemagick zip unzip ngrep colordiff
apt-get -y install gettext graphviz dos2unix
