#!/bin/sh

# [... default stuff that your distro may throw in here ...] #

# Set up an icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x282828 --height 17 &

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# Set a nice background
feh --bg-fill --no-fehbg ~/.wallpapers/forest.jpg

# Fire up screensaver
xscreensaver -no-splash &

# Add transparent windows
picom &

# Run xmodmap
xmodmap ~/.xmodmap

exec xmonad
