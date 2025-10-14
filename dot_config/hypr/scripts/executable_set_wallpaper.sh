#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: exactly one argument must be parsed"
    exit 1
fi

wallpaper="$1"
transitions=(wipe center outer any)
transition=${transitions[$RANDOM  % ${#transitions[@]}]}

swww img "$wallpaper" --transition-fps 60 --transition-step 255 --transition-type "$transition"