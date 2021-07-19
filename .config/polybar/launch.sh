#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=eDP-1 polybar main & 
MONITOR=HDMI-1 polybar secondary &

echo "Polybar launched . . ."
