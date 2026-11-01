#!/bin/bash

options="  Lock\n  Logout\n  Shutdown\n  Reboot"

choice=$(echo -e "$options" | rofi -dmenu -i -selected-row 0 -p "Power Menu")

case "$choice" in
    "  Lock") hyprlock ;;
    "  Logout") hyprctl dispatch exit ;;
    "  Shutdown") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
esac
