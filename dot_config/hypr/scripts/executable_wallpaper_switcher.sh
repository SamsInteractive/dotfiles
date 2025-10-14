#!/bin/bash

if pgrep -x rofi >/dev/null; then
	pkill -x rofi
else
	wallpaperdir="$HOME/Wallpapers"

	if [ ! -d "$wallpaperdir" ]; then
    	mkdir -p "$wallpaperdir"
	fi

	CWD="$(pwd)"

	cd "$wallpaperdir" || exit 1

	selected=$(
    	find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.webp' -o -iname '*.tiff' -o -iname '*.tif' \) -print0 |
    	while IFS= read -r -d '' wallpaper; do
        	displayname=$(basename "$wallpaper")
			absolute="$PWD/${wallpaper#./}"
			printf '%s\0display\x1f%s\x1ficon\x1f%s\n' "$absolute" "$displayname" "$absolute"
    	done | rofi -dmenu -p "" -show-icons \
		-theme-str 'element-icon { size: 64px; }'
	)

	if [ -n "$selected" ]; then
    	$HOME/.config/hypr/scripts/set_wallpaper.sh "$selected"
	fi
fi
