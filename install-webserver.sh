#!/bin/env bash

# A script to install an Nginx webserver

if ( which nginx )
then 
  echo "\n==== Nginx is already installed. ====\n"
else 
  echo -e "\n==== Installing Nginx ====\n"
  sudo apt install -y nginx
fi