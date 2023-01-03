# Underdog Devs Devops Class I

We want a local vm that is Ubuntu that is running an nginx webserver
from
local
windows
osx
ubuntu

# usage

install git

clone the repo

install a hypervisor

write a file or command the provisions a ubuntu vm

connect to the vm

install the webserver

test the webserver

## **Windows**

### Install Chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

```

### Install Multipass

run:

```
choco install virtualbox multipass
```

## **macOS**

`zsh webserver.zsh`

### Install Homebrew

Paste the following command in a macOS Terminal

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### add brew to path

```
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/oscar/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/oscar/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### **Install Multipass**

run:

```
$ brew install --cask multipass
```

## **Linux**

#### **Install Multipass**

`bash webserver.sh`

## Provioning an Ubuntu VM

This is the command format / usage to create and provision an Ubuntu VM with a custom number of CPUs, disk, and RAM size:

~~~
multipass launch --cpus 4 --disk 20G --mem 8G
~~~

Here is the command to create a VM named `slick-machine` that shares wifi network with the host and has these properties:

- 1 CPU
- 20GB Hard Disk space
- 2GB RAM

~~~
muLtipass launch --network Wi-Fi --cpus 1 --disk 20G --mem 2G --name slick-machine
~~~

**NOTE:** VM creation will fail if disk isn't at least 20G.

**NOTE:** Some Windows install don't install the bridged router (wifi)

---
## Provision a VM
`multipass launch --name infradog --cloud-init cloud-init.yaml && ssh -i id_ed25519 oscar@192.168.64.10`

## Delete a VM
`multipass delete infradog && multipass purge`
