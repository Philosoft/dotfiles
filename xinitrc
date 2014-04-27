#!/bin/bash

# Настройка клавиатуры
setxkbmap us -option; setxkbmap "us,ru" -option "grp:toggle,grp_led:scroll,compose:menu,ctrl:nocaps"
# включаем дополнительный цифровой блок
numlockx on

# облака {
dropbox start &
yandex-disk start &
# }

# Настройка иксов
xrdb -merge "${HOME}/.Xdefaults" ; xrdb -merge "${HOME}/.XCompose"

# мультимедиа клавиши
xbindkeys -f /home/philosoft/.xbindkeysrc &
# полнофункциональный тачпад
synclient TapButton1=1 TapButton2=2 TapButton3=3 &
# отключать тач во время печати
syndaemon -d -k -i 0.2

# Настройка курсора
xsetroot -cursor_name left_ptr

# звук {
pulseaudio --start
pasystray &
# }

# флешки и т.п.
[[ $(command -v pcmanfm) ]] && pcmanfm -d

# Запуск WM
exec awesome
#ck-launch-session dbus-launch openbox-session
