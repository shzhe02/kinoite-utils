#!/bin/bash

# Ensure script is not run as root
if [ "$EUID" -eq 0 ]
    then echo "Please don't run as root."
    exit
fi

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo -u
flatpak install flathub io.github.zen_browser.zen -y
