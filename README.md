# Fomentum Solis

**Status:** ✅ Active  
**Description:** Solar-powered website hosting on a Raspberry Pi

## About

This project powers a static website hosted on a solar-powered Raspberry Pi. It provides the necessary components to monitor battery status, deploy a static website, and serve content using an energy-efficient web server.

## Features

- Battery monitoring script that tracks:
  - Battery percentage
  - Battery voltage
  - Current load
  - System uptime
  - CPU temperature
- Docker configuration for hosting with Static Web Server
- Deployment scripts for website updates
- Cloudflare Tunnel integration for secure access

## Components

### Battery Monitor

The `battmon.py` script calculates battery metrics and outputs them as JSON to be read by your website. This allows visitors to see real-time information about the solar power system.

### Web Server

The project uses [Static Web Server](https://static-web-server.net/) within Docker, chosen for its performance on low-powered devices like the Raspberry Pi.

### Website Files

Ensure you add all website files into the website folder. If you rename website to something else, ensure you update this within the docker-compose.yml file line 9 & 10:

   ```
# Navigate to the website directory
cd /srv/source/website || {
  echo "[-] Directory not found: /srv/source/website"
  exit 1
}
   ```

### Deployment

The `deploy_website.sh` script handles website updates by pulling the latest code and refreshing the Docker containers.

## Getting Started

### Prerequisites

- Raspberry Pi (Zero or other model)
- Solar power setup with LiFePO4 battery
- Docker and Docker Compose installed
- Cloudflare account (for Tunnel)

### Installation

1. Clone this repository to your Raspberry Pi:
   ```
   git clone https://github.com/RM-PBD/fomentum-solis.git
   ```

2. Set up your environment variables in `.settings.env`

3. Deploy your website:
   ```
   ./scripts/deploy_website.sh
   ```

4. Start the battery monitoring:
   ```
   python3 ./scripts/battmon.py
   ```

## Hardware

A complete hardware guide and build instructions can be found in the project write-up here: https://www.ryanmcclure.earth/solar.html

## License

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)