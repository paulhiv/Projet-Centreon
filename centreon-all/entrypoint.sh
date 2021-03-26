#!/bin/bash
if [$1 -eq 'start']; then
	/usr/sbin/init 
	systemctl daemon-reload
	systemctl enable rh-php72-php-fpm httpd24-httpd mariadb centreon cbd centengine gorgoned snmptrapd centreontrapd snmpd
	systemctl restart rh-php72-php-fpm.service
	systemctl restart mysql
	systemctl start httpd24-httpd
	while true
	do
		journalctl
	done
fi
