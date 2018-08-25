#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

extras_composer_install() {
  if [ ! -f "/usr/local/bin/composer" ]; then
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
  fi
}

extras_mailhog_install() {
  if [ ! -f "/usr/local/bin/mailhog" ]; then
    wget --quiet -O /usr/local/bin/mailhog \
      https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64

    chmod +x /usr/local/bin/mailhog
  fi
}

extras_mhsendmail_install() {
  if [ ! -f "/usr/local/bin/mhsendmail" ]; then
    wget --quiet -O /usr/local/bin/mhsendmail \
      https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
      
    chmod +x /usr/local/bin/mhsendmail
  fi
}

extras_ohmyzsh_install() {
  if [ ! -d "/home/vagrant/.oh-my-zsh" ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
    chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh
    chown vagrant:vagrant /home/vagrant/.zshrc
  fi
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive

extras_composer_install
extras_mailhog_install
extras_mhsendmail_install
extras_ohmyzsh_install
