#!/bin/bash

# Настройка клавиатуры
setxkbmap us -option
setxkbmap "us,ru" -variant ",winkeys" -model pc105 -option "grp:toggle,grp_led:scroll,compose:rwin,ctrl:nocaps"
#numlockx on

# Настройка иксов
xrdb -merge "${HOME}/.Xdefaults"
xrdb -merge "${HOME}/.XCompose"

# Настройка курсора
xsetroot -cursor_name left_ptr

# Автозагрузка
dropbox start &
xscreensaver -no-splash &
#(sleep 5; feh --bg-scale "$(find /home/philosoft/Downloads/Konachan.com -type f | shuf | head -n 1)")&
kbdd &

# Запуск WM
WM='awesome'
exec $WM
#WM='gnome-session'
#WM='openbox-session'
if [ $WM == 'awesome' ]; then
    ln -s /home/philosoft/.gtkrc-2.0.zenburn /home/philosoft/.gtkrc-2.0
    exec $WM
else
    if [ -L .gtkrc-2.0 ]; then
        unlink .gtkrc-2.0
        exec $WM
    fi
fi
