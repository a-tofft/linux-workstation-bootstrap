# Workstation Bootstraping Repo

Repository to assist in bootstraping my Linux (Ubuntu) and macOS workstations and to take the headache away from remembering to install everything. It will perform the following tasks:
 - Update system
 - Install desired software via apt/snaps/homebrew
 - Download dotfiles & Symlink via Stow (github.com:a-tofft/dotfiles)

## Before you re-install, checklist:

 - Have all local downloads been backuped?
 - Have all commits been pushed?
 - Have you backuped gnome/mac?
   - `cd $HOME/linux-workstation-bootstrap/files/gnome && ./backup-gnome.sh`

## Downloading Repo 

1. Create SSH keys:
```shell
sudo apt update 
sudo apt install -y ssh git
ssh-keygen -t rsa -b 4096 -C "tofft.anton@gmail.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
```

2. Copy SSH Keys:
```shell
cat ~/.ssh/id_rsa.pub
```

3. Add SSH Keys: [github.com/settings/ssh/new](https://github.com/settings/ssh/new)

4. Clone Repository:
```shell 
git clone git@github.com:a-tofft/linux-workstation-bootstrap.git 
cd linux-workstation-bootstrap 
```


---
## Bootstrapping Linux


### Step 1
Run initial bootstrap script to update system and install ansible
```shell
./bootstrap.sh 
```


### Step 2
Run playbook to deploy system. Do not run as sudo. 
```shell 
ansible-playbook bootstrap-workstation-ubuntu.yml --ask-become-pass -e ansible_user=$(whoami)
```

### Step 3
Download dotfiles
```shell 
$ git clone git@github.com:a-tofft/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow -t ~ */
```

### Step 4

Install Dropbox: https://www.dropbox.com/install


### Step 5
Restore Gnome Settings
```shell
cp -r ~/Dropbox/Backups/$(hostname)/shell-extensions/* ~/.local/share/gnome-shell/extensions/
dconf load / < ~/Dropbox/Backups/$(hostname)/dconf-settings
```



---
## Bootstrapping MacOS

### Step 1
Install Ansible, Brew & Git
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
sudo pip3 install --upgrade pip
pip3 install ansible
```

### Step 2
Run playbook to deploy system. Do not run as sudo. 
```shell 
ansible-playbook bootstrap-workstation-mac.yml --ask-become-pass -e ansible_user=$(whoami)
```

### Step 3
Set defaults for system settings
```shell 
cd $HOME/linux-workstation-bootstrap/files/macos && ./defaults.sh
```

### Step 4
Download dotfiles
```shell 
$ git clone git@github.com:a-tofft/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow -t ~ */
```