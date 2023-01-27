#!/bin/zsh

# Remove SSH fingerprint in known_hosts
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$(multipass info infradog | grep IPv4 | awk '{print $2}')"

# Delete the VM
if ( multipass info infradog > /dev/null ) 
then
  echo -e "\n==== Deleting Infradog machine ====\n"
  multipass delete infradog && multipass purge
else 
  echo -e "\n==== Infradog machine does not exist ====\n"
fi 
  echo -e "\n==== Infradog machine deleted ====\n"

# Destroy SSH keys
echo -e "\n==== Deleted SSH keys ====\n"
rm id_ed25519*

# Remove yaml file
rm cloud-init.yaml