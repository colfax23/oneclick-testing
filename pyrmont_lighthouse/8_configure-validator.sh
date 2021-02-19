#!/usr/bin/bash

sudo useradd --no-create-home --shell /bin/false lighthousevalidator
sudo chown -R lighthousevalidator:lighthousevalidator /var/lib/lighthouse/validators

cat > /etc/systemd/system/lighthousevalidator.service << EOL
[Unit]
Description=Lighthouse Validator
Wants=network-online.target
After=network-online.target
[Service]
Type=simple
User=lighthousevalidator
Group=lighthousevalidator
Restart=always
RestartSec=5
ExecStart=/usr/local/bin/lighthouse validator_client --network pyrmont --datadir /var/lib/lighthouse --graffiti "ORGY client"
[Install]
WantedBy=multi-user.target
EOL

sudo systemctl daemon-reload
sudo systemctl start lighthousevalidator
sudo systemctl status lighthousevalidator
sudo systemctl enable lighthousevalidator
echo "run this to see logs: sudo journalctl -fu lighthousevalidator.service"

