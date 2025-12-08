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

ln -sf "$wallpaper" "$current_wallpaper"

magick "$wallpaper[0]" -resize 1000x -strip "$settings_dir/wallpaper_preview.jpg"

swww img "$wallpaper" --transition-fps 60 --transition-step 255 --transition-type "$transition"

matugen image "$wallpaper"
