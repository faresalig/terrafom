#!/bin/bash

# Update packages
sudo apt-get update -y

# Fix broken packages
sudo apt-get install -f -y

# Install required packages
sudo apt-get install apache2 unzip wget -y

# Enable and start Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Download the website template
wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip

# Unzip it
unzip 2117_infinite_loop.zip

# Move content to web root
sudo cp -r 2117_infinite_loop/* /var/www/html/