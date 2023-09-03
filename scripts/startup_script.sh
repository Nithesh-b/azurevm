#!/bin/bash
# Create a dummy file in /tmp folder
touch /tmp/my_dummy_file.txt

# Install essential build tools (if not already installed)
echo "Installing build tools..."
sudo apt-get update
sudo apt-get install -y build-essential

# Download Vim source code
echo "Downloading Vim source code..."
wget -O /tmp/vim-source.tar.gz https://github.com/vim/vim/archive/master.tar.gz

# Extract Vim source code
echo "Extracting Vim source code..."
tar -zxvf /tmp/vim-source.tar.gz -C /tmp/

# Navigate to the Vim source directory
cd /tmp/vim-master

# Configure and compile Vim
echo "Configuring and compiling Vim..."
./configure
make
sudo make install

# Verify Vim installation
vim --version

# Clean up
rm /tmp/my_dummy_file.txt
