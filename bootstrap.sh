#!/bin/sh

## ----------------------------------
## Description: Upgrade system 

sudo apt update
sudo apt -y full-upgrade
sudo apt -y autoremove

## ----------------------------------
## Description: Install ansible dependencies

sudo apt install -y python-openssl ca-certificates python3-pip python-pyasn1

FOLDER=$HOME/.local/bin
mkdir -p "$FOLDER"

sudo chown -R "$USER:$USER" "$FOLDER"
sudo chmod -R 755 "$FOLDER"

python3 -m pip install --user --upgrade pip setuptools keyrings.alt
python3 -m pip install --user testresources wheel
sudo python3 -m pip install --user -r requirements_ansible.txt

## ----------------------------------
## Description: Install ansible

if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA..."
    sudo apt-add-repository -y ppa:ansible/ansible
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible and base utilities..."
    sudo apt update
    sudo apt install -y software-properties-common ssh ansible git python-apt
else
    echo "Ansible is already installed"
fi

## ----------------------------------
## Description: Update Certificates

sudo update-ca-certificates --fresh
export SSL_CERT_DIR=/etc/ssl/certs