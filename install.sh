#!/bin/bash

ln -s $(readlink -f vimrc) ~/.vimrc
mkdir -p ~/.vim/{backup,tmp,undo,sessions,bundle}
cd vim
for f in *; do
  ln -s $(readlink -f "$f") ~/.vim/$f
done

cd -

cd ~/.vim/bundle
wget https://github.com/Shougo/neobundle.vim/archive/master.zip
unzip master.zip
rm master.zip
mv neobundle.vim{-master,}
cd -
