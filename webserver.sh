#!/bin/bash

# If multipass is present
if ( command -v multipass )
then
  echo "Multipass is already installed."
else 
  sudo snap install multipass
fi

# If infradog is running
if ( multipass list | grep -q "^infradog\s*Running" )
then
  echo "infradog VM already created."
else
  echo "Creating the infradog VM."
  multipass launch --name infradog
fi

multipass list

multipass shell infradog
