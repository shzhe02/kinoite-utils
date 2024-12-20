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
