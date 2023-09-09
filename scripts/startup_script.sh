#!/bin/bash

# Variables
DECIDIM_VERSION="0.22.0" # Change this to the desired Decidim version
DECIDIM_APP_NAME="my-decidim-app" # Change this to your app's name
DB_PASSWORD="your_password" # Change this to your database password
SECRET_KEY_BASE="your_secret_key_base" # Change this to a secret key base for Decidim

# Function to install Docker and Docker Compose
install_docker_and_compose() {
  # Update package list and install required tools
  sudo apt update
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

  # Add Docker repository and GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Install Docker (latest version)
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io

  # Install Docker Compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  # Enable and start Docker service
  sudo systemctl enable --now docker

  sudo chmod 666 /var/run/docker.sock

  # Check if Docker is active
  if systemctl is-active docker >/dev/null; then
    echo "Docker is active."
  else
    echo "Docker is not active."
  fi
}

# Install Git
sudo apt install git -y

# Install Docker and Docker Compose
install_docker_and_compose

# Clone Decidim repository
git clone https://github.com/decidim/docker.git $DECIDIM_APP_NAME

# Navigate to the Decidim app directory
cd $DECIDIM_APP_NAME

# Start Decidim using Docker Compose
docker-compose up -d

echo "Decidim is now installed and running at http://localhost:3000"
