#!/usr/bin/bash

# TODO: take in config file and port as params
SSH_CONFIG_FILE=/etc/ssh/sshd_config

## Change SSH port (for now always to 6749)
if [[ ! $(sudo ss -tulpn | grep ':6749') ]]
then
    echo 'port is available'
    sudo sed -i 's/#Port\ 22/Port\ 6749/g' $SSH_CONFIG_FILE
    sudo systemctl restart ssh
    echo 'done updating port'
else
    echo "port is not available, exiting"
    exit 1
fi

