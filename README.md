Gozma12
=======

Just one more ubuntu/precise64 vagrant box for all my personal projects. Gozma12 provides a wonderful development environment without requiring me to install PHP, a web server, and any other server software on my local machine. No more worrying about messing up my operating system!

Included Software
-----------------

* Ubuntu 12.04
* PHP 5.3
* Apache2
* MySQL
* Postgres

Included Recipes
----------------

* PHP5 Environment
* WordPress Environment
..* WP-Cli
..* WP I18N Tools
* ZendServer Environment

Cleanup
-------

How to cleanup the box before packaging.

    apt-get clean
    
    rm /etc/udev/rules.d/70-persistent-net.rules

    dd if=/dev/zero of=/EMPTY bs=1M
    rm -f /EMPTY

    cat /dev/null > ~/.bash_history && history -c
    

Packaging & Install
-------------------

How to package your new provisioned box.

    vagrant package
    vagrant box add ddd2phpexperts/box package.box
