# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

source /etc/profile
set -o emacs

# variables {{{
export EDITOR='vim'
export GTK_IM_MODULE='xim'
export LANG='ru_RU.UTF-8'
[[ -x $(command -v vimpager) ]] && export PAGER='vimpager' || export PAGER='less'
export PATH="/home/$USER/bin:$PATH"
# :: Java variables {
export CLASSPATH="/home/philosoft/jlibs/jfreechart-1.0.13.jar:/home/philosoft/jlibs/jcommon-1.0.16.jar:/home/philosoft/jlibs/j3d-1_5_2-linux-amd64/lib/ext/j3dcore.jar:/home/philosoft/jlibs/j3d-1_5_2-linux-amd64/lib/ext/vecmath.jar:/home/philosoft/jlibs/j3d-1_5_2-linux-amd64/lib/ext/j3dutils.jar:./"
# :: nice fonts (+antialiasing)
export _JAVA_OPTIONS=-Dawt.useSystemAAFontSettings=on
# }
export LD_LIBRARY_PATH='/home/philosoft/jlibs/j3d-1_5_2-linux-amd64/lib/amd64/'
export LD_PRELOAD="/home/philosoft/lib/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
# }}}

# Истроия {{{
# не записывать одинаковые строки в историю и игнорировать повторяющиеся пробелы
HISTCONTROL=ignoreboth
# Не заносить в историю команды
HISTIGNORE='reset:clear:mplayer:ls:la'
HISTSIZE="10000"

# Не перезаписывать файл истории, а добовлять
shopt -s histappend
# Не разрывать многострочные команды в истории
shopt -s cmdhist
# Встраивает переносы строки вместо двоеточий
shopt -s lithist
# Добавлять команды в историю немедленно
PROMPT_COMMAND='history -a'
# Хранить время выполнения команды
HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
# }}}

# prompt {{{
# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

#PS1="$ "
PS1='\[\033[01;33m\][\t]\[\033[1;31m\] \w\033[00m\]\n$ '
# }}}

# Алиасы {{{
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi
# }}}

# Автодополнение {{{
if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# }}}

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# }}}

# Функции {{{
makespectrums() {
	find "${@}" -maxdepth 3 -name "*.mp3" |
	while read file
	do
		file="$(readlink -f "${file}")"
		local dirname="$(dirname "${file}")/_album_info/spectrums/"
		local basename="$(basename "${file}")"
		[ ! -e "${dirname}${basename%.mp3}.png" ] && (mkdir -p "${dirname}" ; sndfile-spectrogram --dyn-range=100 "${file}" 800 480 "${dirname}${basename%.flac}.png")
		echo $file complete
	done

	unset file
}

luakit_flash_watch() {
	local pid=$(pgrep luakit)
	movs=''
	for i in /proc/$pid/fd/* ; do
		if [[ $(stat $i | egrep 'Flash.*\(deleted\)' | grep -v Flash_) ]]; then
			movs="$movs $i";
		fi
	done

	echo $movs

	for i in $movs ; do
		mplayer -fs -ao alsa $i
	done
}

luakit_flash_save() {
	local pid=$(pgrep luakit)
	movs=''
	for i in /proc/$pid/fd/* ; do
		if [[ $(stat $i | egrep 'Flash.*\(deleted\)' | grep -v Flash_) ]]; then
			movs="$movs $i";
		fi
	done

	for i in $movs ; do
		cp "$i" "$(basename $i).flv"
	done
}
# }}}

# Автозапуск {{{
if [[ -x $(command -v fortune) ]]; then
	fortune
fi
# }}}
