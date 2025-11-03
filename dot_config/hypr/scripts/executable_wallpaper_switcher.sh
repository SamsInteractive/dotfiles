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
    	done | rofi -dmenu -i -p "" -show-icons \
		-theme-str 'element { orientation: vertical; padding: 6px; margin: 2px; }
		listview {
			columns: 3;
			lines: 3;
			dynamic: true;
			fixed-height: true;
			fixed-columns: false;
			spacing: 4px;
			scrollbar: false;
			layout: vertical;
		}

		element-icon {
			size: 160px;
			scale: true;
			padding: -30px 0 -30px 0;
			horizontal-align: 0.5;
			vertical-align: 0.5;
		}

		element-text {
			padding: 0px;
			horizontal-align: 0.5;
		}

		window { height: 50%; width: 50%; }

		/* old - element-icon { size: 64px; } */
		'
	)



	if [ -n "$selected" ]; then
    	$HOME/.config/hypr/scripts/set_wallpaper.sh "$selected"
	fi
fi
