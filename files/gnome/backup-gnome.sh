#!/bin/sh
mkdir -p ~/Dropbox/Backups/$(hostname)/shell-extensions
cp -r ~/.local/share/gnome-shell/extensions/* ~/Dropbox/Backups/$(hostname)/shell-extensions
dconf dump / > ~/Dropbox/Backups/$(hostname)/dconf-settings