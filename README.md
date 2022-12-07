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

# **Chocolatey**


Chocolatey is a machine-level, command-line package manager and installer for Windows software.


### Installing Chocolatey on Windows


Paste the following command in into your shell and press Enter

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))



# **Homebrew**


Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's operating system, macOS, as well as Linux.


### Installing Homebrew on macOS


Paste the following command in a macOS Terminal or Linux shell prompt

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

The script explains what it will do and then pauses before it does it. 

Read about other [installation options](https://docs.brew.sh/Installation)



# **Installing Multipass**



### Windows Installation


Make sure the network you’re connected to is marked Private (which really means Trusted), otherwise Windows will prevent Multipass from starting. We’re working on resolving that issue.  

Run the installer and it will guide you through the steps necessary. You will need to allow the installer to gain Administrator privileges.  

You will need either Hyper-V enabled (only Windows 10 Professional or Enterprise), or VirtualBox installed.  



`choco install virtualbox multipass`

#### Run


Multipass defaults to using Hyper-V as its virtualization provider. If you’d like to use VirtualBox, start either Command Prompt (cmd.exe) or PowerShell as Administrator and run:

C:\WINDOWS\system32> multipass set local.driver=virtualbox

Now, to run normal Multipass commands, open either Command Prompt (cmd.exe) or PowerShell as a regular user. Use multipass version to check your version or multipass launch to create your first instance.

### macOS Installation


To install Multipass, simply execute:

$ brew install --cask multipass

You’ve installed Multipass. Time to run your first commands! Use **multipass version** to check your version or **multipass launch** to create your first instance.

### Linux Installation


## snap
## RedHat


To install Multipass, simply execute:

	$ sudo yum install -y epel-release
	$ sudo yum install -y snapd
	$ sudo systemctl enable --now snapd.socket
	$ sudo ln -s /var/lib/snapd/snap /snap
	$ snap install multipass
