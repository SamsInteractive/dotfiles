#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: exactly one argument must be parsed"
    exit 1
fi

wallpaper="$1"
settings_dir="$HOME/.config/hypr/settings"
current_wallpaper="$settings_dir/current_wallpaper"

if [ ! -d "$settings_dir" ]; then
    mkdir -p "$settings_dir"
fi


transitions=(wipe any center outer any)
transition=${transitions[$RANDOM  % ${#transitions[@]}]}

swww img "$wallpaper" --transition-fps 60 --transition-step 255 --transition-type "$transition"

if [ ! -f "$current_wallpaper" ]; then
    touch "$current_wallpaper"
fi
echo "$wallpaper" >"$current_wallpaper"