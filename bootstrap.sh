#!/bin/sh
#
# Gozma Bash Bootstrap
#

###########################################################
# System
###########################################################

gozma_system_update() {
    apt-get -y update
    apt-get -y upgrade
}

gozma_system_locale() {
    apt-get -y install language-pack-en
    echo "LANG=en_US.UTF-8" > /etc/default/locale
    echo "LC_ALL=en_US.UTF-8" > /etc/default/locale

    dpkg-reconfigure locales
}

gozma_system_timezone() {
    echo "America/Sao_Paulo" > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
}
###########################################################
# Apache2
###########################################################

gozma_apache2_install() {
    apt-get -y install apache2
}

gozma_apache2_configure() {
    echo "ServerName localhost" > /etc/apache2/conf.d/name
    a2enmod rewrite
}

###########################################################
# MySQL
###########################################################

gozma_mysql_install() {
    echo "mysql-server mysql-server/root_password password secret" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password secret" | debconf-set-selections
    apt-get -y install mysql-server
}

###########################################################
# PostgreSQL
###########################################################

gozma_postgresql_install() {
    apt-get -y install postgresql postgresql-contrib
}

###########################################################
# PHP 5
###########################################################

gozma_php5_install() {
    apt-get -y install php5 php5-mysql libapache2-mod-php5
}

###########################################################
# Good Stuff
###########################################################

gozma_goodstuff_install() {
    apt-get -y install subversion git-core
}

###########################################################
# Bootstrap Functionality
###########################################################

gozma_system_update
gozma_system_locale
gozma_system_timezone

gozma_apache2_install
gozma_apache2_configure

gozma_mysql_install
gozma_postgresql_install
gozma_php5_install
gozma_goodstuff_install