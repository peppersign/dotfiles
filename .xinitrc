#!/bin/bash

#Dual monitor setup
xrandr --output eDP-1 --mode 1366x768 --output HDMI-1 --mode 1920x1080 --left-of eDP-1
xrandr --output eDP-1 --brightness 0.8

#Wallpaper
feh --bg-scale /home/senkoloaf/Downloads/mrrobotwallpaper.jpg &

#Colorscheme
wal --backend colorthief -i ~/Downloads/animegirlcoding.jpg -n

#Compositor
picom --config /home/senkoloaf/.config/picom/picom.conf &

#WM
exec i3


