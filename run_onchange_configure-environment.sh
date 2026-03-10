#!/usr/bin/env bash
set -euo pipefail

all_packages=(
	zsh
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	fastfetch
	bat
	btop
	yazi
	waybar
	rofi
	kitty
	cava
	imagemagick
	zoxide
	neovim
	swaync
	starship
	nwg-look
	matugen
	hyprshot
	hyprpolkitagent
	fzf
	eza
	adw-gtk-theme
	network-manager-applet
	hyprlock
	thunar
)

echo "Dotfiles request packages/files to be installed for correct functionality."
echo "Checking installed packages..."

packages=()
installed=$(pacman -Qq)

for pkg in "${all_packages[@]}"; do
    if ! grep -qx "$pkg" <<<"$installed"; then
        packages+=("$pkg")
    fi
done


if [[ ${#packages[@]} -eq 0 ]]; then
	echo "All packages already installed. Continuing."
else
	echo "Packages to be installed (pacman): ${packages[@]}"
	read -rp "Continue to install? (y/n) " decision

	if [[ "$decision" == [yY] || -z "$decision" ]]; then
		sudo pacman -S --needed "${packages[@]}"
	else
		echo "Not proceeding with package installation."
	fi
fi
