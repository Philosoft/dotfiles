# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Истроия {{{
# не записывать одинаковые строки в историю и игнорировать повторяющиеся пробелы
HISTCONTROL=ignoreboth
# Не заносить в историю команды
HISTIGNORE='reset:clear:mplayer:ls:la'
export HISTSIZE="10000"

# Не перезаписывать файл истории, а добовлять
shopt -s histappend
# Не разрывать многострочные команды в истории
shopt -s cmdhist
# Встраивает переносы строки вместо двоеточий
shopt -s lithist
# Добавлять команды в историю немедленно
PROMPT_COMMAND='history -a'
# Хранить время выполнения команды
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
# }}}

# prompt {{{
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#PS1="$ "
PS1='\[\033[01;33m\][\t]\[\033[1;31m\] \w\033[00m\]\n$ '
# }}}

# Алиасы {{{
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# }}}

# Автодополнение {{{
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# }}}

export PATH="~/bin:$PATH"
export EDITOR='vim'

# less с цветами {{{
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# }}}

# Всякое {{{
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# «Эвристическое» исправление директорий
# работает *только* для cd
shopt -s cdspell

# Сделать less более дружелюбным для не-текстовых входных файлов
# (больше информации в lesspipe(1) )
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# }}}

# Функции {{{
makespectrums()
{
  find "${@}" -maxdepth 3 -name "*.mp3" |
  while read file
  do
    file="$(readlink -f "${file}")"
    dirname="$(dirname "${file}")/_album_info/spectrums/"
    basename="$(basename "${file}")"
    [ ! -e "${dirname}${basename%.mp3}.png" ] && (mkdir -p "${dirname}" ; sndfile-spectrogram --dyn-range=100 "${file}" 800 480 "${dirname}${basename%.flac}.png")
    echo $file complete
  done
}
# }}}

# Автозапуск {{{
if [[ -z $DISPLAY ]]; then
  echo 'Start X [Y/n]? ';
  read awnser;
echo "#######################";
echo "# Starting X in 1 sec #";
echo "#######################";
sleep 1 && sudo service gdm stop ; exec startx &> /dev/null;
else
    if [[ $(command -v fortune) ]]; then
        fortune;
    fi
fi
# }}}
