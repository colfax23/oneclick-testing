#!/usr/bin/bash

SSH_PORT=${1:-6749}

echo "SSH port is $SSH_PORT"

## enable UFW
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing

# new ssh port
sudo ufw allow $SSH_PORT/tcp
# changed ssh port
sudo ufw deny 22/tcp
# for geth
sudo ufw allow 30303

# for lighthouse
sudo ufw allow 9000
sudo ufw enable
# how to do the below programatically?
# sudo ufw status numbered
