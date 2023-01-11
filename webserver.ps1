# Install Chocolatey
if (Get-Command choco) {
  Write-Host "Choco already installed."
}
else {
  Write-Host "Installing Chocolatey ..." -BackgroundColor DarkMagenta
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))  
}

# Install VirtualBox with multipass (including extenstions and guest additions)
Write-Host "Installing Multipass with VirtualBox as hypervisor ..."  -BackgroundColor DarkMagenta
# See if you can choco install version of virtualbox
# How to upgrade existing VMs to work with new version

if (Get-Command virtualbox) {
  Write-Host "VirtualBox already intalled."
}
else {
  choco install virtualbox virtualbox.extensionpack virtualbox-guest-additions-guest.install
}

if (Get-Command multipass) {
  "Multipass already installed."
}
else {
  choco install multipass
}

# Verify that setting multipass to use virtualbox instead of Hyper-V worked
if ((multipass get local.driver) -eq "virtualbox") {
  Write-Host "VirtualBox is already set as local.driver"
}
else {
  multipass set local.driver=virtualbox
}

# Run multipass to create vm (launch)
if (multipass info infradog) {
  Write-Host "infradog VM already created."
} else {
  Write-Host "Create the Virtual Machine ..."  -BackgroundColor DarkMagenta
  muLtipass launch --name infradog
}

# List created multipass machines
Write-Host "Listing Multipass VirtualBox virtual machines available ..." -BackgroundColor Magenta
multipass list
multipass shell infradog
