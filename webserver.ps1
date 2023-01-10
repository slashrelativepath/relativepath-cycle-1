# Install Chocolatey
Write-Host "Installing Chocolatey ..." -BackgroundColor DarkMagenta
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install VirtualBox with multipass (including extenstions and guest additions)
Write-Host "Installing Multipass with VirtualBox as hypervisor ..."  -BackgroundColor DarkMagenta
# Wrap line 7 in IF statement (if virtualbox already installed)
# See if you can choco install version of virtualbox
# How to upgrade existing VMs to work with new version
choco install virtualbox virtualbox.extensionpack virtualbox-guest-additions-guest.install
choco install multipass

# Verify that setting multipass to use virtualbox instead of Hyper-V worked
$localDriver = multipass get local.driver
Write-Host "The local.driver is: " $localDriver

# Run multipass to create vm (launch)
Write-Host "Create the Virtual Machine ..."  -BackgroundColor DarkMagenta
muLtipass launch --network Wi-Fi --cpus 1 --disk 20G --mem 2G # --name slick-machine
multipass set local.driver=virtualbox

# List created multipass machines
Write-Host "Listing Multipass VirtualBox virtual machines available ..." -BackgroundColor Magenta
multipass list

