#!/bin/bash

# Variables
DECIDIM_VERSION="0.22.0" # Change this to the desired Decidim version
DECIDIM_APP_NAME="my-decidim-app" # Change this to your app's name
DB_PASSWORD="your_password" # Change this to your database password
SECRET_KEY_BASE="your_secret_key_base" # Change this to a secret key base for Decidim

# Function to install Docker and Docker Compose
install_docker_and_compose() {
  # Add Docker repository
  sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

  # List available repositories
  sudo dnf repolist -v

  # Install Docker (latest version)
  sudo dnf install --nobest docker-ce

  # Install containerd.io
  sudo dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm

  # Install Docker Compose
  curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
  sudo mv docker-compose /usr/local/bin && sudo chmod +x /usr/local/bin/docker-compose
  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

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
sudo dnf install git -y

# Install Docker and Docker Compose
install_docker_and_compose

# Clone Decidim repository
git clone --branch v$DECIDIM_VERSION https://github.com/decidim/decidim.git $DECIDIM_APP_NAME

# Navigate to the Decidim app directory
cd $DECIDIM_APP_NAME

# Start Decidim using Docker Compose
docker-compose up -d

echo "Decidim is now installed and running at http://localhost:3000"