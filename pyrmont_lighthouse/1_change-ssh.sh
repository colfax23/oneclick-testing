#!/usr/bin/bash

#SSH_CONFIG_FILE=${1:-/etc/ssh/sshd_config}

# testing
SSH_CONFIG_FILE=$1
if [ -z SSH_CONFIG_FILE ]
then
    exit 1
fi
# end testing

## Change SSH port (for now always to 6749 - ORGY)
if [ -z `sudo ss -tulpn | grep ':6749'`]
then
    echo 'port is available'
    sudo sed -i 's/#Port\ 22/Port\ 6749/g' $SSH_CONFIG_FILE
    sudo systemctl restart ssh
    echo 'done updating port'
else
    echo "port is not available, exiting"
    exit 1
fi

