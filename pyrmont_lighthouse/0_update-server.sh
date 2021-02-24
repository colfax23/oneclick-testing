#!/usr/bin/bash

## Update the server
sudo apt -y update && sudo apt -y upgrade
sudo apt -y dist-upgrade && sudo apt -y autoremove

## Download some necessary software
sudo apt -y install curl

# Reboot the server
# TODO: figure out an elegant way to do this and reintegrate into the flow
# sudo reboot
echo "Please reboot manually now, then run next script"
