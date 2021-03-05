#!/bin/bash
services=('php-fpm','httpd','mariadb','centreon','cbd','centengine','gorgoned','snmptrapd','centreontrapd','snmpd')
function main()
    {
        for i in "${services[@]}"
        do
            test=1
            i
            if ($? -eq 0)
            then
                test=0
            fi
            while (test -eq 1); do
              sleep 1
            done
        done
    }
main()
centreon