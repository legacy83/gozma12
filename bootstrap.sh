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

###########################################################
# Apache2
###########################################################

gozma_apache2_install() {
    apt-get -y install apache2
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
gozma_apache2_install
gozma_mysql_install
gozma_postgresql_install
gozma_php5_install
gozma_goodstuff_install