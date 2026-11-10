#!/usr/bin/env bash

# Update package list and install Node.js + NPM
sudo apt update && sudo apt install -y nodejs npm

# Install pm2 globally
sudo npm install -g pm2

# Stop any currently running instance of the app (|| true prevents failure if not running)
pm2 stop "example_app" || true

# Change directory to your cloned repository folder on EC2
cd ~/circleci-lab

# Install project dependencies
npm install

# Start the application using PM2
pm2 start ./bin/www --name "example_app"