#!/usr/bin/env bash


LOGOUT=" Logout"
REBOOT=" Reboot"
SHUTDOWN=" Shutdown"
options="$LOGOUT\n$REBOOT\n$SHUTDOWN"


function confirm {
    opt=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Are you sure?" -theme ~/.config/polybar/themes/powermenu.rasi)

    case "$1" in
        out) [[ "$opt" = "Yes" ]] && i3-msg exit || exit 0 ;;
        re) [[ "$opt" = "Yes" ]] && systemctl reboot || exit 0 ;;
        shut) [[ "$opt" = "Yes" ]] && systemctl poweroff || exit 0 ;;

    esac
}


function up {
    echo -en $(uptime -p | awk '{ print (NF==5) ? $2 "h " $4 "m" : $2 "m"   }') 
}


action=$(echo -e "$options" | rofi -dmenu -p " Uptime $(up)" -theme ~/.config/polybar/themes/powermenu.rasi)
echo $action
case "$action" in
    $LOGOUT) confirm out ;;
    $REBOOT) confirm re ;;
    $SHUTDOWN) confirm shut ;; 
    *) exit 0 ;;

esac
