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


---


## What is Multipass?

Multipass is a tool from Canonical, makers of Ubuntu Linux, for quickly generating Ubuntu virtual machines. Multipass saves developers time, energy, and overhead and helps Mac and Windows users quickly spin up disposable Ubuntu machines for testing. It works natively on Hyper-V (but only certain versions) and will run VirtualBox with minor configuration changes.

## How to install Multipass on Windows.

### Prerequisites

#### Install Git

- Install [Git for Windows](https://git-scm.com/download/win) then clone the repo.


Multipass supports two hypervisor options for Windows: Hyper-V and VirtualBox. Since Hyper-V is only supported in Window 10 Pro / Enterprise v. 1803 or later, these instructuctions will only focus on VirtualBox since it is more widely supported. [(learn more)](https://multipass.run/docs/installing-on-windows)

#### Install VirtualBox

- Download and install [VirtualBox](https://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html).

### Install Multipass

Unlike in MacOS and Linux-based systems, Windows doesn't require much command line interaction to install. Instead, you just download the executable from the [multipass website](https://multipass.run/download/windows) and install it.

Caveat: Make sure to allow administrator privileges

### Upgrade Multipass

If you need to upgrade just download the [latest installer](https://multipass.run/download/windows) and run it. 

## Using Multipass on a Windows 10 host

You can use CMD or PowerShell as your terminal. PowerShell is recommended because it has native bash shell and works with linux commands like sudo. To use VirtualBox launch **Command Prompt** (cmd.exe) or **PowerShell** as **Administrator** and run:

~~~
C:\WINDOWS\system32> multipass set local.driver=virtualbox
~~~

Once you have run this command, VirtualBox is now configured as your hypervisor for multipass.

## Basic Commands

Here is some basic commands you should know:

### Create new virtual machine

To create a new default multipass VM with a randomly generated machine name:

~~~
multipass launch
~~~

### List available multipass commands

~~~
multipass
~~~

### List running virtual machines (VMs)

~~~
multipass list
~~~

### Update the VM repo

~~~
mutipass exec <VM_NAME> sudo apt update
~~~


### List the Ubuntu version of guest VM

~~~
multipass exec <VM_NAME> cat /etc/lsb-release
~~~

### Login to VM

~~~
multipass shell <VM_NAME>
~~~

### Upgrade Ubuntu

Once logged in:

~~~
sudo apt upgrade -y
~~~

### Transfer files between Windows host and Ubuntu guest

~~~
multipass transfer <HOST_FILE_PATH> <VM_NAME> <GUEST_FILE_PATH>
~~~

### Connect folder between host and guest for bidirectional transfer

To have a "Guest Additions" type access we need to mount a folder

~~~
multipass mount <HOST_FILE_PATH> <VM_NAME>:/home/ubuntu/<FOLDER_NAME>
~~~

### List all shared folders mounted in VM

~~~
multipass info <VM_NAME>
~~~

### Check if VM is connected to the internet

~~~
ping ubuntu.com
~~~

### Get IP address of the VM

~~~
ip addr
~~~

---

>**CAVEAT:** The VM and host are on completely separate networks so they cannot ping each other. By default, VirtualBox uses a NAT network configuration when a new VM is created. We want a **bridged network**. This is a network where the vm shares the IP with the physical host machine.

---

### Logout of the VM

~~~
logout
~~~

### See what networks are available to VM

~~~
multipass networks
~~~

### Create new VM with bridged adapter

In most cases, in order to have the guest and host share the same network, _**we want to connect to the wifi network**_. If the wifi network is named "Wi-Fi", then create a new VM with a bridged network adapter simply by typing:

~~~
multipass launch --network Wi-Fi
~~~

### Delete multipass VM

~~~
multipass stop <VM_NAME>
multipass delete <VM_NAME>
multipass purge
~~~

### How to SSH

1. First configure the ssh server daemon.

Open **/etc/ssh/sshd_config** by typing:

~~~
sudo nano sshd_config
~~~

2. Set **PasswordAuthentication** to yes, save and exit

3. Retart the ssh service for the new config to take effect

~~~
sudo service ssh restart
~~~

### To create a new user

Out-of-the-box Multipass is configured with a default user of **ubuntu** with no password. To update the default **ubuntu** user password, type the following and then follow the prompts:

~~~
sudo passwd ubuntu
~~~

1. To create a brand new user with a password type:

~~~
sudo adduser <NEW_USERNAME>
~~~

2. Then enter a new password at the "New password" prompt

3. Enter your name at "Full Name" prompt, and just hint enter to skip anything you don't want to fill in. Then hit "y" and enter

4. Give the new user **sudo permissions** by adding user to sudo group:


~~~
sudo adduser <NEW_USERNAME> sudo
exit
~~~

5. Multipass list to get IP address and VM name

### Tunnel Into VM with SSH

Now that we've setup SSH, let's use it to tunnel into our VM:

~~~
ssh <NEW_USERNAME>:<VM_IP>
~~~

Enter password at the prompt. If password is correct you should be logged in now.

### Connnecting with SSH Key

A common frustration of developers, sys admins, and devops professionals alike is that if you cannot see the password as you type. Thus it is easy to type a wrong password multiple times and then get locked out of the system. Then you have to contact support to get it unlocked again and it burns time as well as can get embarassing. That's what SSH keys are for. By setting up an SSH key you don't have to remember your password to connect!

Here are the basic steps for setting up and connecting (AKA: _**tunneling**_) with SSH keys.

1. Generate new ssh key on Windows machine in PowerShell and enter a password.

~~~
ssh-keygen -t rsa
~~~

1. Copy the **id_rsa.pub** path into your clipboard (CTRL + C). This is the location of your public key.

2. Copy your public key to the vm

~~~
scp <PUBLIC_KEY_PATH> <USERNAME>@<VM_IP>:~
~~~

3. Create SSH folder for user and move key there

~~~
mkdir .ssh
mv id_rsa.pub ~/.ssh/authorized_keys
exit
~~~

4. Finally, logout and connect to VM with SSH:

~~~
logout
ssh <USERNAME>@<VM_IP>
~~~

You should now be securely logged in via SSH without needing to type a password!


## Resources

- https://www.youtube.com/watch?v=qoROrgsWGqQ
- https://multipass.run/docs
- https://www.youtube.com/watch?v=Z91l6ZdQjhI


