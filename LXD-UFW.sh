#!/bin/bash

echo "The current UFW-States of each LXD - Container:"
onlineC="$(lxc list -c ns | awk '!/NAME/{ if ( $4 == "RUNNING" ) print $2}')"
for c in $onlineC
do
	echo "*** LXD-Container: $c ***"
	lxc exec $c -- /bin/bash -c "sudo ufw status verbose"
done
