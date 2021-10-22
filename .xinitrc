#!/bin/bash

#Dual monitor setup
xrandr --output eDP-1 --mode 1366x768 --output HDMI-1 --mode 1920x1080 --right-of eDP-1
xrandr --output eDP-1 --brightness 0.8

#Wallpaper
feh --bg-scale $HOME/something.jpg &

#Colorscheme
wal --backend colorthief -i $HOME/something.jpg -n &

#Compositor
picom --config $HOME/.config/picom/picom.conf &

#Notifier
dunst &

#WM
exec i3


