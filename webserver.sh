#!/bin/bash

if command -v multipass > /dev/null 2>&1; then
echo "Multipass is already installed."
else 
sudo snap install multipass
fi

if multipass list | grep -q "^infradog\s*Running"; then
echo "infradog VM already created."
else
echo "Creating the infradog VM."
multipass launch --name infradog
fi

multipass list
multipass shell infradog