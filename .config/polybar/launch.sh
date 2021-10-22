#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=eDP-1 polybar main -c ~/.config/polybar/config.ini &
MONITOR=HDMI-1 polybar secondary -c ~/.config/polybar/config.ini &

echo "Polybar launched . . ."
