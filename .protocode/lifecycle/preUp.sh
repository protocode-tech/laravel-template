#!/bin/bash

set -e

# Get vars declared globally in protocode to update values in .env file accordingly
export $(grep -v '^#' .protocode-runtime/.env | xargs)

# Duplicate env file
cp .env.example .env

# Update .env values
sed -i "s|^DB_HOST=.*|DB_HOST=${DB_HOST}|" .env
sed -i "s|^DB_USERNAME=.*|DB_USERNAME=${DB_USER}|" .env
sed -i "s|^DB_PASSWORD=.*|DB_PASSWORD=${DB_PASSWORD}|" .env
sed -i "s|^MAIL_HOST=.*|MAIL_HOST=maildev|" .env

# Install intelephense extension for vscode
code --install-extension bmewburn.vscode-intelephense-client
