#!/bin/bash

set -e  # Exit on error

# Log start time
echo "[+] Deploy started at $(date)"

# Navigate to the website directory
cd /srv/source/website || {
  echo "[-] Directory not found: /srv/source/website"
  exit 1
}

# Reset any local changes to ensure clean state
echo "[+] Resetting any local changes..."
git reset --hard HEAD

# Pull the latest code from GitHub
echo "[+] Pulling latest code from GitHub..."
git pull --rebase origin main

# Check and remove cloudflared container if it exists
if [ "$(docker ps -aq -f name=cloudflared)" ]; then
  echo "[*] Stopping and removing existing cloudflared container..."
  docker stop cloudflared || true
  docker rm cloudflared || true
fi

# Restart the Docker containers
echo "[+] Restarting Docker containers..."
docker compose down
docker compose up -d --force-recreate

# Log end time
echo "[✓] Deploy complete at $(date)"
echo "SOLAR POWER BABY!"
