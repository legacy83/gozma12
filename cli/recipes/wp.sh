#!/bin/sh

###########################################################
# WP-CLI INSTALL
###########################################################

if [ ! -d '/opt/wp-cli' ]; then
    composer create-project wp-cli/wp-cli /opt/wp-cli --no-dev

    echo '# WP-CLI Environmnet' >> /home/vagrant/.bashrc
    echo 'export PATH=$PATH:/opt/wp-cli/bin' >> /home/vagrant/.bashrc
    echo 'source /opt/wp-cli/utils/wp-completion.bash' >> /home/vagrant/.bashrc
fi

###########################################################
# WP-CLI UPDATE
###########################################################

cd /opt/wp-cli && composer install --no-dev

###########################################################
# WP I18N Tools
###########################################################

if [ ! -d '/opt/wp-i18n-tools' ]; then
    svn checkout http://i18n.svn.wordpress.org/tools/trunk/ /opt/wp-i18n-tools
fi

###########################################################
# Apache2 Under Vagrant
###########################################################

sed -ri 's/^(export APACHE_RUN_USER=)(.*)$/\1vagrant/' /etc/apache2/envvars
sed -ri 's/^(export APACHE_RUN_GROUP=)(.*)$/\1vagrant/' /etc/apache2/envvars

chown -R vagrant:vagrant /var/lock/apache2
chown -R vagrant:vagrant /var/log/apache2
chown -R vagrant:vagrant /var/www

###########################################################
# Apache2 Restart
###########################################################

service apache2 restart