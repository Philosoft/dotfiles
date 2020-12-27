if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/thephilosoft/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/thephilosoft/.vim/dein')
    call dein#begin('/home/thephilosoft/.vim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/home/thephilosoft/.vim/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('junegunn/vim-easy-align')
    call dein#add('godlygeek/tabular')

    call dein#add('takac/vim-hardtime')

    call dein#add('vim-scripts/bufexplorer.zip')
    call dein#add('vim-scripts/L9')
    call dein#add('itchyny/lightline.vim')
    call dein#add('kshenoy/vim-signature')
    call dein#add('osyo-manga/vim-over')
    call dein#add('tpope/vim-unimpaired')

    " vim enhanchments {
    call dein#add('mhinz/vim-startify')
    call dein#add('szw/vim-ctrlspace')
    "" }
    "
    " programming helpers {
    call dein#add("Shougo/unite.vim")
    call dein#add('Raimondi/delimitMate')
    call dein#add('majutsushi/tagbar')
    call dein#add('mattn/emmet-vim')
    call dein#add('rking/ag.vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tpope/vim-vinegar')
    call dein#add('scrooloose/syntastic')
    call dein#add('sjl/gundo.vim')
    call dein#add('tmhedberg/matchit')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('tpope/vim-abolish')
    call dein#add('tpope/vim-fugitive')
    call dein#add('gregsexton/gitv')
    call dein#add('tpope/vim-surround')
    call dein#add('vim-scripts/camelcasemotion')

    " NeoBundle 'vimwiki/vimwiki'

    " frontend {
    call dein#add('digitaltoad/vim-jade')
    call dein#add('mustache/vim-mustache-handlebars')
    " }

    " html {
    call dein#add('othree/html5.vim')
    call dein#add('Valloric/MatchTagAlways')
    " }

    " colorschemes {
    call dein#add('tomasr/molokai')
    call dein#add('altercation/vim-colors-solarized')
    " } colorschemes

    call dein#add("tpope/vim-repeat")
    call dein#add('haya14busa/incsearch.vim')
    " }
    call dein#add("ConradIrwin/vim-bracketed-paste")

    call dein#add("chr4/nginx.vim")
    call dein#add("cespare/vim-toml")

    " Required:
    call dein#end()
    call dein#save_state()
endif

"	NeoBundle "Shougo/vimproc.vim", {
"					\ 'build':
"					\ {
"						\ 'unix':
"						\ g:make
"					\ }
"				\ }
