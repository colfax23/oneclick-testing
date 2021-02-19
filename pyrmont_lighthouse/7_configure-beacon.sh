#!/usr/bin/bash

## Configure Beacon Node

sudo useradd --no-create-home --shell /bin/false lighthousebeacon
sudo mkdir -p /var/lib/lighthouse/beacon
sudo chown -R lighthousebeacon:lighthousebeacon /var/lib/lighthouse/beacon

# TODO: make this more robust
sudo cp ./lighthouse/lighthouse /usr/local/bin

cat > /etc/systemd/system/lighthousebeacon.service << EOL
[Unit]
Description=Lighthouse Beacon Node
Wants=network-online.target
After=network-online.target
[Service]
Type=simple
User=lighthousebeacon
Group=lighthousebeacon
Restart=always
RestartSec=5
ExecStart=/usr/local/bin/lighthouse beacon_node --datadir /var/lib/lighthouse --network pyrmont --staking --eth1-endpoint http://127.0.0.1:8545 --metrics
[Install]
WantedBy=multi-user.target
EOL


sudo systemctl daemon-reload
sudo systemctl start lighthousebeacon
echo "run this to check the status: sudo systemctl status lighthousebeacon"
sudo systemctl enable lighthousebeacon
echo "or this: sudo journalctl -fu lighthousebeacon.service"

