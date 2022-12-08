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

run:

`snap install multipass`

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
# Linux Installation
## snap


### RedHat


To install Multipass, simply execute:

	$ sudo yum install -y epel-release
	$ sudo yum install -y snapd
	$ sudo systemctl enable --now snapd.socket
	$ sudo ln -s /var/lib/snapd/snap /snap
	$ snap install multipass

### ***The inevitible problems***

Because I'm not hip with the times and still run centOS 7 I run into problems pretty commonly.
The lastest cool thing is most likely not available namely kernels.
I'm on `3.10` and the multipass minimum requirement is `3.17` [ticket](https://github.com/canonical/multipass/issues/2178)

If you want to explore into Elrepo to update you kernel, visit [here](http://elrepo.org/tiki/HomePage)


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
