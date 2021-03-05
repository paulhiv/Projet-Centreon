#!/usr/bin/expect -f

set timeout -1

spawn \
/usr/share/centreon/bin/registerServerTopology.sh -u admin -t Poller -h centreon-poller -n remote-bdd

expect \
"centreon-poller: please enter your password:"

send -- "azerty"

expect \
"Which IP do you want to use as CURRENT NODE IP ?"

