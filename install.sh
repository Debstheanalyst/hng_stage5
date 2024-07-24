#!/bin/bash

# Install required dependencies
sudo apt update
sudo apt install -y net-tools docker.io nginx logrotate

# Copy the main script to /usr/local/bin and make it executable
sudo cp devopsfetch.sh /usr/local/bin/devopsfetch
sudo chmod +x /usr/local/bin/devopsfetch

# Set up systemd service
sudo cp devopsfetch.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable devopsfetch.service
sudo systemctl start devopsfetch.service

# Configure log rotation
sudo tee /etc/logrotate.d/devopsfetch > /dev/null <<EOL
/var/log/devopsfetch.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
    create 644 root root
    sharedscripts
    postrotate
        systemctl reload devopsfetch.service > /dev/null 2>/dev/null || true
    endscript
    su root root
}
EOL

# Ensure the log file exists and set correct permissions
sudo touch /var/log/devopsfetch.log
sudo chown root:root /var/log/devopsfetch.log
sudo chmod 644 /var/log/devopsfetch.log

# Confirmation messages
echo "Setup completed. DevOpsFetch service is now running and logs are managed."
echo "You can use the service by running 'sudo devopsfetch' followed by the appropriate flags."
echo "The monitoring service has also been set up and started."
