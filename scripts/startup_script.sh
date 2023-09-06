#!/bin/bash
# Create a dummy file in /tmp folder
# touch /tmp/my_dummy_file.txt

# # Install essential build tools (if not already installed)
# echo "Installing build tools..."
# sudo apt-get update
# sudo apt-get install -y build-essential

# # Download Vim source code
# echo "Downloading Vim source code..."
# wget -O /tmp/vim-source.tar.gz https://github.com/vim/vim/archive/master.tar.gz

# # Extract Vim source code
# echo "Extracting Vim source code..."
# tar -zxvf /tmp/vim-source.tar.gz -C /tmp/

# # Navigate to the Vim source directory
# cd /tmp/vim-master

# # Configure and compile Vim
# echo "Configuring and compiling Vim..."
# ./configure
# make
# sudo make install

# # Verify Vim installation
# vim --version

# # Clean up
# rm /tmp/my_dummy_file.txt

# Check if Docker is installed and install it if necessary
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    rm get-docker.sh
    echo "Docker installed."
fi

# Check if Docker Compose is installed and install it if necessary
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed."
fi

# Clone the repository
git clone https://github.com/decidim/docker.git

# Change directory to the cloned folder
cd docker

# Run docker-compose up in detached mode
/usr/local/bin/docker-compose up -d