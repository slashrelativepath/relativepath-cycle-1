#!/bin/env bash

# A script to provision, install, and log in to a webserver on Mac OS.

if [ "$(uname -s)" = "Darwin" ]
then 
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
elif [ "$(uname -s)" = "Linux" ]
then 
  # If multipass is present
  if ( command -v multipass )
  then
    echo "Multipass is already installed."
  else 
    sudo snap install multipass
  fi
else
  echo "architecture unsupported."
fi

# Create SSH key pair
if [ -f id_ed25519 ]
then 
  echo -e "\n==== SSH key pair present ====\n"
else
  echo -e "\n==== Creating SSH key pair ====\n"
  ssh-keygen -t ed25519 -q -f id_ed25519 -C "infradog@underdogs.dev" -N ""
fi


# Create cloud-init yaml with public SSH key and user name
if [ -f cloud-init.yaml ]
then 
  echo -e "\n==== Cloud-init exists ====\n"
else
  echo -e "\n==== Creating cloud-init ====\n"
  cat <<- EOF > cloud-init.yaml
users:
  - default
  - name: infradog
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - $(cat id_ed25519.pub)
EOF
fi

# Check multipass list results for vm name and send to null
if ( multipass list | grep infradog > /dev/null ) 
then
  echo -e "\n==== Infradog VM exists ====\n"
else 
  # Create VM
  echo -e "\n==== Creating Infradog VM ====\n"
  multipass launch  --name infradog  --cloud-init cloud-init.yaml
fi 

# Copy Nginx install script to VM
scp -i ./id_ed25519 -o StrictHostKeyChecking=no install-webserver.sh infradog@$(multipass info infradog | grep IPv4 | awk '{print $2}'):/home/infradog

# Run Install webserver inside VM
ssh -i id_ed25519 -o StrictHostKeyChecking=no infradog@$(multipass info infradog | grep IPv4 | awk '{print $2}') 'bash install-webserver.sh'

# Use SSH with keys to log in to the VM
ssh -i id_ed25519 -o StrictHostKeyChecking=no infradog@$(multipass info infradog | grep IPv4 | awk '{print $2}')
