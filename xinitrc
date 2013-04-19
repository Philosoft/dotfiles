#!/bin/bash

# Настройка клавиатуры
setxkbmap us -option; setxkbmap "us,ru" -option "grp:toggle,grp_led:scroll,compose:menu,ctrl:nocaps"
numlockx on
dropbox start &

# Настройка иксов
xrdb -merge "${HOME}/.Xdefaults" ; xrdb -merge "${HOME}/.XCompose"

xbindkeys -f /home/philosoft/.xbindkeysrc &
synclient TapButton1=1 TapButton2=2 TapButton3=3 &
syndaemon -d -k -i 0.2

# Настройка курсора
xsetroot -cursor_name left_ptr


# Запуск WM
exec ck-launch-session dbus-launch awesome
#ck-launch-session dbus-launch openbox-session
