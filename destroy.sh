#!/bin/bash

# Destroy machine and delete fingerprint

# Remove host from known host
if ( ssh-keygen -H -F $(multipass info Infradog |  grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | awk '{print $2}') ) 
then
  echo -e "\n==== Deleting host from known host ====\n"
  ssh-keygen -f ~/.ssh/known_hosts -R $(multipass info Infradog |  grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | awk '{print $2}')
else 
  echo -e "\n==== Fingerprint does not exist in known host ====\n"
fi 

# Only delete the machine if it exists
if ( multipass info Infradog > /dev/null ) 
then
  echo -e "\n==== Deleting Infradog machine ===="
  multipass delete Infradog && multipass purge
else 
  echo -e "\n==== Infradog machine does not exist ===="
fi 

# Delete an ssh key pair
if [ -f id_ed25519 ]
then 
  echo -e "\n==== Removing ssh key ====\n"
  rm id_ed25519 id_ed25519.pub
else
  echo -e "\n==== No keys present ====\n \n==== Destroy complete ====\n"
fi

