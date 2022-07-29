#!/bin/sh
mkdir -p ~/Dropbox/Backups/$(hostname)/shell-extensions
cp -R ~/.local/share/gnome-shell/extensions/* ~/Dropbox/Backups/$(hostname)/shell-extensions
cp -R ~/.config/autostart ~/Dropbox/Backups/$(hostname)/
dconf dump / > ~/Dropbox/Backups/$(hostname)/dconf-settings
