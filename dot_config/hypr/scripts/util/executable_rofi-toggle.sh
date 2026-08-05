#!/usr/bin/env bash
set -euo pipefail

if pgrep -x rofi >/dev/null; then
    pkill -x rofi
else
    if [[ ${1:-} == "window" ]]; then
        rofi -show window -show-icons
    else
        rofi -show drun -show-icons
    fi
fi
