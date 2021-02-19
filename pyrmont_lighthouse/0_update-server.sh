#!/usr/bin/bash

## Update the server
sudo apt -y update && sudo apt -y upgrade
sudo apt -y dist-upgrade && sudo apt -y autoremove

## Download some necessary software
sudo apt -y install curl

# Reboot the server
# sudo reboot
