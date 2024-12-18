#!/bin/bash

# Ensure script is not run as root
if [ "$EUID" -eq 0 ]
    then echo "Please don't run as root."
    exit
fi

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

PATH="$HOME/.cargo/bin:$PATH"
export PATH

# Create a toolbox for building
toolbox create build-rs --distro fedora --release 42 -y
toolbox run --container build-rs sudo dnf install cmake gcc openssl-devel perl -y
toolbox run --container build-rs cargo install nu --locked
toolbox run --container build-rs cargo install zellij starship

# Copying config files for nushell, zellij, helix, and alacritty
cp -r ../../assets/config/nushell ~/.config/nushell
cp -r ../../assets/config/zellij ~/.config/zellij
cp -r ../../assets/cache/starship ~/.cache/starship
cp -r ../../assets/config/helix ~/.config/helix
cp -r ../../assets/config/alacritty ~/.config/alacritty

# Manage permissions for the pasted files
chmod -R 700 ~/.config/nushell
chmod -R 700 ~/.config/zellij
chmod -R 700 ~/.cache/starship
chmod -R 700 ~/.config/helix
chmod -R 700 ~/.config/alacritty

# Cleanup
podman stop build-rs
toolbox rm build-rs
toolbox rmi registry.fedoraproject.org/fedora-toolbox:42
