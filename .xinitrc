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
(sleep 3 ; feh --bg-scale "$(ls /home/philosoft/Downloads/Konackan.com | shuf | head -n 1)"&)

# Запуск WM
#exec openbox-session
exec awesome
