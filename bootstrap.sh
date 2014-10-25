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
    echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale

    locale-gen en_US.UTF-8
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
    echo "mysql-server mysql-server/root_password password root@secret" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password root@secret" | debconf-set-selections
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
    apt-get -y install php5 php5-mysql php5-pgsql libapache2-mod-php5
    apt-get -y install php5-memcache php5-imagick php5-mcrypt php5-imap php5-curl php-pear php5-gd
}

gozma_php5_composer_install() {
    if [ ! -e '/usr/local/bin/composer' ]; then
        curl -sS https://getcomposer.org/installer | php
        mv composer.phar /usr/local/bin/composer
    fi

    composer self-update
}

###########################################################
# Memcached
###########################################################

gozma_memcached_install() {
    apt-get -y install memcached
}

###########################################################
# Redis
###########################################################

gozma_redis_install() {
    apt-get -y install redis-server
}

###########################################################
# Beanstalkd
###########################################################

gozma_beanstalkd_install() {
    apt-get -y install beanstalkd
}

###########################################################
# Fabric
###########################################################

gozma_fabric_install() {
    apt-get -y install fabric
}

###########################################################
# Good Stuff
###########################################################

gozma_goodstuff_install() {
    apt-get -y install sqlite
    apt-get -y install subversion git-core
    apt-get -y install imagemagick zip unzip ngrep colordiff
    apt-get -y install gettext graphviz dos2unix
}

###########################################################
# Bootstrap Functionality
###########################################################

#gozma_system_update
#gozma_system_locale
#gozma_system_timezone
#
#gozma_apache2_install
#gozma_apache2_configure
#
#gozma_mysql_install
#gozma_postgresql_install
#
#gozma_php5_install
#gozma_php5_composer_install
#
#gozma_memcached_install
#gozma_redis_install
#gozma_beanstalkd_install
#gozma_fabric_install
#gozma_goodstuff_install