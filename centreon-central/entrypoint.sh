#!/bin/bash
systemctl enable rh-php72-php-fpm httpd24-httpd mariadb centreon cbd centengine gorgoned snmptrapd centreontrapd snmpd
systemctl restart rh-php72-php-fpm.service
systemctl start httpd24-httpd
/usr/sbin/init