#!/bin/zsh

# Delete the VM
if ( multipass info Infradog > /dev/null ) 
then
  echo -e "\n==== Deleting Infradog machine ====\n"
  multipass delete Infradog && multipass purge
else 
  echo -e "\n==== Infradog machine does not exist ====\n"
fi 
  echo -e "\n==== Infradog machine deleted ====\n"