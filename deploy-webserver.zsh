#!/bin/zsh

# A script to provision, install, and log in to a webserver on Mac OS.

# The default password prompt timeout for the sudoers security policy is 5 minutes
sudo true

# Install Brew
if ( which brew > /dev/null ) 
then
  echo -e "\n==== Brew installed ====\n"
else 
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "\n==== Installing Brew ====\n"
fi

# Install Multipass
if ( which multipass > /dev/null )
then 
  echo -e "\n==== Multipass installed ====\n"
else
  brew install --cask multipass
  echo -e "\n==== Installing multipass ====\n"
fi

# Check multipass list results for vm name and send to null
if ( multipass list | grep Infradog | grep Running > /dev/null ) 
then
  echo -e "\n==== Infradog VM exists ====\n"
else 
  # Create VM
  echo -e "\n==== Creating Infradog VM ====\n"
  multipass launch  --name Infradog  
fi 

multipass list

multipass shell Infradog
