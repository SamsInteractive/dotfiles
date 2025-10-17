#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: exactly one argument must be parsed"
    exit 1
fi

wallpaper="$1"
settings_dir="$HOME/.config/hypr/settings"
current_wallpaper="$settings_dir/current_wallpaper"

TRANSITIONS=(wipe any center outer any)
transition=${TRANSITIONS[$RANDOM  % ${#TRANSITIONS[@]}]}

if [ ! -d "$settings_dir" ]; then
    mkdir -p "$settings_dir"
fi

if [ ! -f "$current_wallpaper" ]; then
    touch "$current_wallpaper"
fi

ln -sf "$wallpaper" "$current_wallpaper"


swww img "$wallpaper" --transition-fps 60 --transition-step 255 --transition-type "$transition"