#!/bin/bash
systemctl daemon-reload
systemctl enable rh-php72-php-fpm httpd24-httpd mariadb centreon cbd centengine gorgoned snmptrapd centreontrapd snmpd
systemctl restart rh-php72-php-fpm.service
systemctl restart mysql
systemctl start httpd24-httpd
while true
do
	sleep 1
done