#!/bin/sh

# SHELL EXTENSIONS
mkdir -p ~/Dropbox/Backups/$(hostname)/shell-extensions
cp -R ~/.local/share/gnome-shell/extensions/* ~/Dropbox/Backups/$(hostname)/shell-extensions

# REMMINA
mkdir -p ~/Dropbox/Backups/$(hostname)/remmina
cp -R ~/.var/app/org.remmina.Remmina/data/remmina/* ~/Dropbox/Backups/$(hostname)/remmina

# STARTUP APPS
cp -R ~/.config/autostart ~/Dropbox/Backups/$(hostname)/

# DCONF SETTINGS (GNOME)
dconf dump / > ~/Dropbox/Backups/$(hostname)/dconf-settings
