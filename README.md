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

<br>
Chocolatey is a machine-level, command-line package manager and installer for Windows software.
<br>

### Installing Chocolatey on Windows

<br>
Paste the following command in into your shell and press Enter
<br>
<pre>Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))</pre>
<br>
<br>

# **Homebrew**

<br>
Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's operating system, macOS, as well as Linux.
<br>

### Installing Homebrew on macOS

<br>
Paste the following command in a macOS Terminal or Linux shell prompt
<br>
<pre>/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"</pre>
<br>
The script explains what it will do and then pauses before it does it. 
<br>
Read about other [installation options](https://docs.brew.sh/Installation)
<br>
<br>

# **Installing Multipass**

<br>

### Windows Installation

<br>
Make sure the network you’re connected to is marked Private (which really means Trusted), otherwise Windows will prevent Multipass from starting. We’re working on resolving that issue.  
<br>
Run the installer and it will guide you through the steps necessary. You will need to allow the installer to gain Administrator privileges.  
<br>
You will need either Hyper-V enabled (only Windows 10 Professional or Enterprise), or VirtualBox installed.  
<br>
<br>

#### Run

<br>
Multipass defaults to using Hyper-V as its virtualization provider. If you’d like to use VirtualBox, start either Command Prompt (cmd.exe) or PowerShell as Administrator and run:
<br>
<pre>C:\WINDOWS\system32> multipass set local.driver=virtualbox</pre>
<br>
Now, to run normal Multipass commands, open either Command Prompt (cmd.exe) or PowerShell as a regular user. Use multipass version to check your version or multipass launch to create your first instance.

### macOS Installation

<br>
To install Multipass, simply execute:
<br>
<pre>$ brew install --cask multipass</pre>
<br>
You’ve installed Multipass. Time to run your first commands! Use **multipass version** to check your version or **multipass launch** to create your first instance.

### Linux Installation

<br>
To install Multipass, simply execute:
<br>
<pre>$ snap install multipass</pre>
