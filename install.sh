##!/bin/bash
#
## vim {{{
#ln -s $(readlink -f vimrc) ~/.vimrc
#mkdir -p ~/.vim/{backup,tmp,undo,sessions,bundle}
#cd vim
#for f in *; do
#  ln -s $(readlink -f "$f") ~/.vim/$f
#done
#
#cd -
#
#cd ~/.vim/bundle
#wget https://github.com/Shougo/neobundle.vim/archive/master.zip
#unzip master.zip
#rm master.zip
#mv neobundle.vim{-master,}
#cd -
## }}}

# bash {
BASH_FILES="bashrc bash_aliases bash_profile bash_logout inputrc xinitrc xxkbrc Xdefaults"
for f in $BASH_FILES; do
	if [[ -f ~/.$f ]]; then
		echo -n "file ~/.${f} already exists. should I overthrow it? [Yn]: "
		read answer
		case $answer in
			[yY]*)
				mv "~/.${f}" "~/.${f}.bak"
				ln -s $(readlink -f $f) ~/.$f
				;;
			[nN]*)
				echo "ok, master. I will not do this"
				;;
			*)
				echo "I cannot understand you. skipping"
				;;
		esac
	fi
done
ln -s ~/.xinitrc ~/.xprofile
# }
