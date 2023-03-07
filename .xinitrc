#!/bin/sh

# [... default stuff that your distro may throw in here ...] #

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# Set keyboard settings
setxkbmap -layout us,ru -option grp:alt_space_toggle
xmodmap ~/.Xmodmap

# Set wallpapers
sync-wal &
set-wal &

# Run picom
picom -b &

# Run notification system
twmnd &

exec dwm
