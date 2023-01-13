#!/bin/bash

# A script to provision and install a webserver on a mac w/zsh

# The default password prompt timeout for the sudoers security policy is 5 minutes
sudo true

# Brew should be installed
if ( which brew > /dev/null ) 
then
  echo -e "\n==== Brew already installed ===="
else 
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "\n==== Installing Brew ===="
fi

# Multipass should be installed
if ( which multipass > /dev/null )
then 
  echo -e "\n==== Multipass already installed ===="
else
  brew install multipass
  echo -e "\n==== Installing multipass ===="
fi

# Create an ssh key pair
if [ -f id_ed25519 ]
then  
  echo -e "==== SSH key already generated ====\n"
else
  echo -e "\n==== Creating ssh key pair ===="
  ssh-keygen -t ed25519 -N '' -f ./id_ed25519
fi

# Add public key to cloud config yaml
if ( cat cloud-config.yaml | grep "$(cat id_ed25519.pub)" )
then 
  echo -e "\n==== SSH key already added to cloud init ===="
else
  echo -e "\n==== Adding public key to cloud config yaml file ===="
  gsed -i "/ssh-ed25519/c\      - $(cat id_ed25519.pub)" cloud-config.yaml
fi

# Check in the multipass list results for vm name and send to null
if ( multipass list | grep Infradog | grep Running > /dev/null ) 
then
  echo -e "\n==== Infradog vm already exists ===="
else 
  # create machine using user data
  echo -e "\n==== Creating infradog vm ====\n"
  multipass launch --cpus 2 --mem 2G --name Infradog --cloud-init cloud-config.yaml
fi 

# Ssh into vm-  grep out the ip from multipass list $()
echo -e "\n==== SSH into vm ===="
ssh -o StrictHostKeyChecking=no -i ./id_ed25519 jason@$(multipass info Infradog |  grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | awk '{print $2}') 