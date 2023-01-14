# **Underdog Devs Devops Class I**

## Goal- create local Ubuntu VM running an NginX webserver from:
* Windows
* Osx
* Ubuntu

&nbsp;

# Usage

- install git

- clone the repo

- install a hypervisor

- write a file or command the provisions an ubuntu vm

- connect to the vm

- install the webserver

- test the webserver

&nbsp;

## **Windows**
---

&nbsp;

### Install Chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

```
&nbsp;

### Install Multipass

`choco install virtualbox multipass`

&nbsp;

## **MacOS**
---

### Configure environment and create VM:

`zsh deploy-webserver.zsh`

### Destroy VM:

`destroy-wevserver.zsh`

### Install Multipass

`brew install --cask multipass`

&nbsp;

## **Linux**
---

### Install Multipass

`snap install multipass`

&nbsp;

### Create and provision an Ubuntu VM 

`multipass launch --name Infradog`

&nbsp;

*NOTE:* VM creation will fail if disk isn't at least 20G.

*NOTE:* Some Windows install don't install the bridged router (wifi)

&nbsp;

### Provision VM
`multipass launch --name infradog --cloud-init cloud-init.yaml && ssh -i id_ed25519 oscar@192.168.64.10`

### Delete VM
`multipass delete infradog && multipass purge`
