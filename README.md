## Overview

**DevOpsFetch** is a tool designed for DevOps professionals to collect and display system information. It retrieves data such as active ports, user logins, Nginx configurations, Docker images, and container statuses. Additionally, it includes a systemd service to continuously monitor and log these activities.

## Features

- **Ports**: Display all active ports and services or provide detailed information about a specific port.
- **Docker**: List all Docker images and containers or provide detailed information about a specific container.
- **Nginx**: Display all Nginx domains and their ports or provide detailed configuration information for a specific domain.
- **Users**: List all users and their last login times or provide detailed information about a specific user.
- **Time Range**: Display activities within a specified time range.

## Requirements

- `net-tools`
- `docker.io`
- `nginx`
- `logrotate`

## Installation

### Prerequisites

Ensure your system has the necessary dependencies installed. You can install them using the installation script provided.

### Installation Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/devopsfetch.git
   cd devopsfetch
   ```

2. **Run the installation script**:
   ```bash
   chmod +x setup_devopsfetch.sh
   sudo ./setup_devopsfetch.sh
   ```

This script will:
- Install the required dependencies.
- Copy the main script to `/usr/local/bin`.
- Set up and start the systemd service.
- Configure log rotation for the service.

## Usage

### Command-line Flags

- `-p, --port [port_number]`: Display active ports. If a port number is provided, detailed information about that port is shown.
- `-d, --docker [container_name]`: Display Docker information. If a container name is provided, detailed information about that container is shown.
- `-n, --nginx [domain]`: Display Nginx information. If a domain is provided, detailed configuration information for that domain is shown.
- `-u, --users [username]`: Display user information. If a username is provided, detailed information about that user is shown.
- `-t, --time [start] [end]`: Display activities within the specified time range.
- `-h, --help`: Display help information.

### Examples

#### Display all active ports
```bash
sudo devopsfetch -p
```

#### Display information for a specific port
```bash
sudo devopsfetch -p 80
```

#### List all Docker images and containers
```bash
sudo devopsfetch -d
```

#### Provide detailed information about a specific Docker container
```bash
sudo devopsfetch -d container_name
```

#### Display all Nginx domains and their ports
```bash
sudo devopsfetch -n
```

#### Provide detailed configuration information for a specific Nginx domain
```bash
sudo devopsfetch -n example.com
```

#### List all users and their last login times
```bash
sudo devopsfetch -u
```

#### Provide detailed information about a specific user
```bash
sudo devopsfetch -u username
```

#### Display activities within a specified time range
```bash
sudo devopsfetch -t "2024-07-01 00:00:00" "2024-07-01 23:59:59"
```

## Logging

DevOpsFetch logs its activities to `/var/log/devopsfetch.log`. Log rotation is configured to manage log files, rotating them daily and retaining logs for 7 days. To view the logs, you can use the following command:

This README provides a comprehensive overview of the DevOpsFetch project, including its features, installation instructions, usage examples, logging mechanism, and contribution guidelines. Adjust the repository URL and any other specific details as necessary.
