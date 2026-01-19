#!/usr/bin/env bash
set -euo pipefail

read -rp "Dotfiles update available. Update now? (y/n): " decision

if [[ "$decision" == [yY] ]]; then
	chezmoi update -v
else
	echo "Not proceeding with update."
fi
