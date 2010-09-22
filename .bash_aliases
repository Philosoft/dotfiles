# включаем цвет
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias la='ls -Alh'
alias ncmpc='ncmpc -c'
alias mc='mc -S zenburn'
alias openports='netstat --all --numeric --programs --inet'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1 -h'

alias df='pydf'

if [ -f /usr/bin/grc ]; then
  alias cat='grc cat'
  alias tail='grc tail'
  alias head='grc head'
  alias ping='grc ping'
  alias traceroute='grc traceroute'
  alias netstat='grc netstat'
fi
