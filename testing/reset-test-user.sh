#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

# What this script does:
# - Creates an empty user called "test"
# - Adds the "test" user to a group called "common"
# - Sets the password of "test" to arstoien (the home row of a Colemak-DHm keyboard)

# Delete user "test"
userdel -r test

# Create user "test"
useradd test

# Add user "test" to the common group
usermod -aG common test

# Add user "test" to the wheel group (for admin privileges)
usermod -aG wheel test

echo "test:arstoien" | chpasswd
