#!/usr/bin/bash

## install Go Ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt update
sudo apt install geth

# set up geth
sudo useradd --no-create-home --shell /bin/false goeth
sudo mkdir -p /var/lib/goethereum
sudo chown -R goeth:goeth /var/lib/goethereum

cat > /etc/systemd/system/geth.service << EOL
[Unit]
Description=Ethereum go client
After=network.target
Wants=network.target
[Service]
User=goeth
Group=goeth
Type=simple
Restart=always
RestartSec=5
ExecStart=geth --goerli --http --datadir /var/lib/goethereum
[Install]
WantedBy=default.target
EOL

sudo systemctl daemon-reload
sudo systemctl start geth
sudo systemctl status geth
# how to check the above?

sudo systemctl enable geth
# sudo journalctl -fu geth.service


### wait for geth to sync ###
