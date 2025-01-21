# Copying config files for nushell, zellij, helix, and alacritty
cp -ru ../../assets/config/nushell/* ~/.config/nushell/
cp -ru ../../assets/config/zellij/* ~/.config/zellij/
cp -ru ../../assets/config/starship/* ~/.config/starship/
cp -ru ../../assets/config/helix/* ~/.config/helix/
cp -ru ../../assets/config/alacritty/* ~/.config/alacritty/
cp -ru ../../assets/cache/starship/* ~/.cache/starship/

# Manage permissions for the pasted files
chmod -R 700 ~/.config/nushell
chmod -R 700 ~/.config/zellij
chmod -R 700 ~/.config/starship
chmod -R 700 ~/.config/helix
chmod -R 700 ~/.config/alacritty
chmod -R 700 ~/.cache/starship
