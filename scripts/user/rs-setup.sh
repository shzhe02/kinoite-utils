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

./migrate-config.sh

# Cleanup
podman stop build-rs
toolbox rm build-rs
toolbox rmi registry.fedoraproject.org/fedora-toolbox:42
