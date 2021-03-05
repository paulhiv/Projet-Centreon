#!/usr/bin/

validator = false
while (validator -eq false)
do
	ping -c 1 centreon-poller
	if ($? -eq 0)
	then
		registerbdd
		validator = true
	fi
done
send -- "1\n"
expect "Do you want to register this server with those informations ?.*"
send -- "y\n"
expect "<CURRENT_NODE_ADDRESS> : Please enter your username*."
send -- "admin\n"
expect "<CURRENT_NODE_ADDRESS> : Please enter your password.*:"
send -- "azerty\n"
expect "<CURRENT_NODE_ADDRESS> : Protocol.*"
send -- "\n"
expect "<CURRENT_NODE_ADDRESS> : Port.*"
send -- "\n"
expect "<CURRENT_NODE_ADDRESS> : centreon root folder.*"
send -- "\n"
expect "Are you using a proxy ?.*"
send -- "n\n"
expect eof

#https://linoxide.com/linux-how-to/install-systemd-centos-redhat/
