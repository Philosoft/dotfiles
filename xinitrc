#!/bin/bash

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
export GNOME_KEYRING_PID
export GNOME_KEYRING_CONTROL

## Настройка клавиатуры
setxkbmap us -option; setxkbmap "us,ru" -option "grp:toggle,grp_led:scroll,ctrl:nocaps"
## включаем дополнительный цифровой блок
numlockx on
#
## облака {
[[ $(command -v dropbox) ]] && dropbox start &
[[ $(command -v yandex-disk) ]] && yandex-disk start &
## }
#
# Настройка иксов
xrdb -merge "${HOME}/.Xdefaults" ; xrdb -merge "${HOME}/.XCompose"
#
## мультимедиа клавиши
xbindkeys -f /home/philosoft/.xbindkeysrc &
# полнофункциональный тачпад
synclient TapButton1=1 TapButton2=2 TapButton3=3 HorizTwoFingerScroll=1 &
# отключать тач во время печати
syndaemon -d -k -i 0.2

## Настройка курсора
xsetroot -cursor_name left_ptr
#
## звук {
pulseaudio --start
pasystray &
## }
#
## флешки и т.п.
[[ $(command -v pcmanfm) ]] && nohup pcmanfm -d &>/dev/null &
xrandr --dpi 141x133

[[ -f ~/.fehbg ]] && eval $(cat ~/.fehbg)

nohup nm-applet &>/dev/null &
[[ $(command -v xscreensaver) ]] && nohup xscreensaver &>/dev/null &
#
## Запуск WM
#exec awesome
#ck-launch-session dbus-launch openbox-session
