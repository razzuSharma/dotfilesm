#!/usr/bin/env bash
systemctl --user import-environment DISPLAY

#simple x hotkey daemon
# sxhkd -c ~/.config/sxhkd/sxhkdrc &

# map caps lock button as escape button
setxkbmap -option caps:escape_shifted_capslock

#but when it is pressed once, treat it as escape
killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape'

# to increase the rate of anykey press 
# use xev -event keyboard to view keysym/keycode
xset r rate 300 40

#status bars for dwm
exec slstatus &
#exec dwmblocks &

#policykit gui
exec /usr/lib/xfce-polkit/xfce-polkit &

#idk what this is
xrdb merge ~/.Xresources
#bash ~/.scripts/bash_scripts/e.sh &

#for wallpaper
nitrogen --restore --set-scaled &

# compositor
picom -b --config=/home/ceaser/.config/picom/picom.conf &

# window managers
#awesome windowmanager
# exec awesome

#dynamic window manager-by suckless
#to update dwm without closing the running apps
while type dwm >/dev/null; do dwm && continue || break; done

#notification daemon
dunst -config ~/.config/dunst/dunstrc &

# lock screen
# xautolock -time 1 -locker slock
# xautolock -time 1 -locker "systemctl suspend" -detectsleep

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

#to start kdeconnect daemon and indicator
# /usr/lib/kdeconnectd &
# kdeconnect-indicator &
