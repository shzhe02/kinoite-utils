#!/bin/bash

rpm-ostree override remove firefox fixefox-langpacks
rpm-ostree install helix alacritty
rpm-ostree install ../../assets/sddm-eucalyptus-drop-modified.rpm
