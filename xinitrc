#!/bin/sh

# Dual monitor setup and bright
xrandr --output eDP-1 --mode 1366x768 --output HDMI-1 --mode 1920x1080 --left-of eDP-1
xrandr --output eDP-1 --brightness 0.8

#Background and compositor
feh --bg-scale /home/senkoloaf/Downloads/animegirlcoding.jpg &
picom -f &

#Colorscheme
wal --backend colorthief -i ~/Downloads/animegirlcoding.jpg -n

#Keybindings
xbindkeys &

#Dunst notifier
dunst &

#Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#Status bar
getdate(){
	dte="$(date +"%a %b %d %H:%M%p")"
	echo -e " $dte"
}

getram(){
	ram="$(free | awk '/Mem/ {printf "%dMB/%dMB\n", $3 / 1024.0, $2 / 1024.0 }')"
	echo -e " $ram"
}

getvolume(){
	vol="$(amixer get Master | awk '/Mono:/ {printf $4}' | tr \[] \ )"
	stat="$(amixer get Master | awk '/Mono:/ {printf $6}')"
	
	[[ "$stat" = "[off]" ]] && echo -e " off" || echo -e "$vol" 
}


getbattery(){
	pw="$(cat /sys/class/power_supply/BAT0/energy_now)"
	total="$(cat /sys/class/power_supply/BAT0/energy_full)"
	bat=$(( $pw*100/$total ))

	echo -e " $bat%"
}

while true; do
	xsetroot -name "  $(getvolume)  $(getram)  $(getdate)  $(getbattery)"
	sleep 1m
done & 


exec dwm
