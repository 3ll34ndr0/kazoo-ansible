#!/bin/bash
set -e

echo " #  #  ##  #### #### #### "
echo " # #  #  #    # #  # #  # "
echo " ##   ####  ##  #  # #  # "
echo " # #  #  # #    #  # #  # "
echo " #  # #  # #### #### #### "
echo "    Ansible  Bootstrap    "
echo ""

echo "Installing Prerequisites"
sudo dnf install -y epel-release
sudo dnf install -y git ansible


echo "Cloning kazoo-ansible Repository"
git clone https://github.com/3ll34ndr0/kazoo-ansible ~/kazoo-ansible

# Bypass this by now.
#echo "Installing kazoo-ansible Roles"
#sudo ansible-galaxy install -r ~/kazoo-ansible/requirements.yml

if [ -e ~/.ssh/id_rsa -a -e ~/.ssh/id_rsa.pub ]
then
    echo "SSH keypair exists. Skipping..."
else
    echo "Generating SSH keypair"
    ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
fi

cd ~/kazoo-ansible

