#!/bin/bash

# Installs and configures git on Raspberry Pi

echo "Enter Git Username:"
read username
echo "Enter Git Email:"
read email

# Git comes pre-installed with Raspbian

# Configure Git
git config --global color.ui true
git config --global push.default simple

git config --global user.name "$username"
git config --global user.email "$email"

