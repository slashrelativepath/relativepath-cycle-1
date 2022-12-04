UNDERDOGDEVS DevOps / Infrastructure Study Group
2022-12-01
HOMEWORK:

1. Clone https://github.com/curl-bash/sturdy-octo-doodle locally
1. Create new branch "hepperle/multipass"
1. Write MD file explaining how to install Multipass on Windows
1. Create pull request for branch


---


## How to install Multipass on Windows.

### Prerequisites

Multipass supports two hypervisor options for Windows: Hyper-V and VirtualBox. Since Hyper-V is only supported in Window 10 Pro / Enterprise v. 1803 or later, these instructuctions will only focus on VirtualBox. [(learn more)](https://multipass.run/docs/installing-on-windows)

#### Install VirtualBox

Download and install [VirtualBox](https://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html).

###




Multipass is a tool from Canonical, makers of Ubuntu Linux, for quickly generating Ubuntu virtual machines. It works natively on Hyper-V (but only certain versions) and will run VirtualBox with minor configuration changes.

Unlike in MacOS and Linux-based systems, Windows doesn't require much command line interaction. Instead, you just download the executable the [multipass website] and install it.

### Usage

You can use CMD or PowerShell

multipass launch

type "multipass" for a list of available commands

multipass list: show what virtual machines are running

multipass will autogenerate the vm name, or you can specific a name like this:

~~~

~~~

Update vm repo:

mutipass exec <VM_NAME> sudo apt update

Get the version of Ubuntu for the VM

multipass exec <VM_NAME> cat /etc/lsb-release

Login to multipass virtual machine with shell commands

multipass shell <VM_NAME>

Looks similar to when we SSH to a remote terminal

Default username: ubuntu

Once logged in:

sudo apt upgrade -y

Transfer files between Windows host and Ubuntu guest with transfer command

multipass transfer <HOST_FILE_PATH> <VM_NAME> <GUEST_FILE_PATH>

To have a "Guest Additions" type access we need to mount a folder

multipass mount <HOST_FILE_PATH> <VM_NAME>:/home/ubuntu/<FOLDER_NAME>

To list all folders that were mounted in VM use the info command

multipass info <VM_NAME>

Check if VM is connected to the internet

ping ubuntu.com

Get IP address of the VM

ip addr

CAVEAT: The VM and host are on completely separate networks so they cannot ping each other

By default, VirtualBox uses a NAT network configuration when a new VM is created

We want a bridged network. This is a network where the vm shares the IP with the physical host machine.

First, logout with

logout

To see what networks are available to multipass

multipass networks


multipass launch --network Wi-Fi


Delete multipass VMs

multipass stop <VM_NAME>
multipass delete <VM_NAME>
multipass purge

How to SSH

First configure the ssh server demon

Open /etc/ssh/sshd_config
sudo nano sshd_config

Set PasswordAuthentication to yes, save and exit

Retart the ssh service for the new config to take effect

sudo service ssh restart


Create ssh user with password

To update the default **ubuntu** user password

sudo passwd ubuntu

To create a new user

sudo adduser <NEW_USERNAME>

The enter a new password at the "New password" prompt

Enter your name at "Full Name" prompt, and just hint enter to skip anything you don't want to fill in. Then hit "y" and enter

Git the new user sudo permissions by adding user to sudo group

sudo adduser <NEW_USERNAME> sudo

exit

multipass list to get ip and vm name

Now that we've setup SSH, let's use it to tunnel into our VM

ssh <NEW_USERNAME>:<VM_IP>

Enter password at the prompt. If password is correct you should be logged in now.


Connnecting with SSH Key

Generate new ssh key on Windows machine in PowerShell

ssh-keygen -t rsa


Copy the id_rsa.pub path into your clipoard (CTRL + C). This is the location of your public key.

Copy your public key to the vm

scp <PUBLIC_KEY_PATH> <USERNAME>@<VM_IP>:~



Create SSH folder for user and move key there


mkdir .ssh
mv id_rsa.pub ~/.ssh/authorized_keys


PURPOSE: Create disposable Ubuntu VMs for testing.
Mac and Windows users can quickly spin up Ubuntu machines for testing


---




















































https://multipass.run/docs
https://www.youtube.com/watch?v=Z91l6ZdQjhI




































































RESOURCES:

- https://www.youtube.com/watch?v=qoROrgsWGqQ

