#!/bin/bash

TMP_NAME=cube-base-temp
echo "Which version of Fedora would you like to base the cube on?"
read -p ">> " ver
echo "What would you like to call your cube?"
read -p ">> " cube_name
# Creating Toolbox
echo [INFO] Creating container...
toolbox create $TMP_NAME --distro fedora --release $ver

# Updating
echo [INFO] Updating toolbox...
toolbox run -c $TMP_NAME sudo dnf update -y

# Preset configs or customize?
read -p "Would you like to customize your cube? [(Y)es/(N)o] " have_customization

while true; do
    case "$have_customization" in
        [Yy]* )
            toolbox enter $TMP_NAME
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo [ERR] Invalid input, please enter either "Y" or "N".
            ;;
    esac
done

read -p "Would you like to add a tag? [(Y)es/(N)o] " have_tag

# Exporting the image
while true; do
    case "$have_tag" in
        [Yy]* )
            read -p "Please enter the tag: " tag
            echo [INFO] Saving to $cube_name:$tag...
            podman commit $TMP_NAME $cube_name:$tag
            break
            ;;
        [Nn]* )
            echo [INFO] Saving to $cube_name...
            podman commit $TMP_NAME $cube_name
            break
            ;;
        * )
            echo [ERR] Invalid input, please enter either "Y" or "N".
            ;;
    esac
done


# Cleanup
echo [INFO] Cleaning up...
podman stop $TMP_NAME > /dev/null 2>&1
toolbox rm $TMP_NAME
