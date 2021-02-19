#!/usr/bin/bash

check_status () {
    syncing=`sudo geth --exec "eth.syncing" attach ipc:/var/lib/goethereum/geth.ipc`
    if [ "$syncing" == "false" ]
    then
        echo "done syncing"
	exit 0
    else
	echo "not done syncing"
	echo $syncing
    fi
}


while [ true ]
do
    check_status
    sleep 5
done
