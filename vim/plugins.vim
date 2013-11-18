"=== Vundle plugins === {
" set nocompatible isn't neccesary when vim load settings from g?vimrc
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" == bundles == {
	" = examples {
	" original repos on github
	" Bundle 'tpop/vim-fugitive'
	" vim-script repos
	" Bundle 'FuzzyFinder'
	" non git-hub repos
	" Bundle 'git://git.blah.com/lol.git
	" }

	" Bundle 'Lokaltog/vim-easymotion'
	Bundle 'vim-scripts/bufexplorer.zip'
	Bundle 'L9'
	Bundle 'gmarik/vundle'
	Bundle 'groenewege/vim-less'
	Bundle 'itchyny/lightline.vim'
	Bundle 'kshenoy/vim-signature'
	Bundle 'osyo-manga/vim-over'
	Bundle 'tpope/vim-unimpaired'
	"
	" vim enhanchments {
	Bundle 'mhinz/vim-startify'
	"" }
	"
	" programming helpers {
	Bundle 'Raimondi/delimitMate'
	Bundle 'SirVer/ultisnips'
	" Bundle 'honza/vim-snippets'
	Bundle 'jakobwesthoff/whitespacetrail'
	Bundle 'kien/ctrlp.vim'
	Bundle 'kien/rainbow_parentheses.vim'
	Bundle 'majutsushi/tagbar'
	Bundle 'mattn/emmet-vim'
	Bundle 'mattn/livestyle-vim'
	Bundle 'mileszs/ack.vim'
	Bundle 'nathanaelkane/vim-indent-guides'
	Bundle 'scrooloose/nerdtree'
	Bundle 'scrooloose/syntastic'
	Bundle 'sjl/gundo.vim'
	Bundle 'tmhedberg/matchit'
	Bundle 'tomtom/tcomment_vim'
	Bundle 'tpope/vim-abolish'
	Bundle 'tpope/vim-fugitive'
	Bundle 'tpope/vim-surround'
	Bundle 'vim-scripts/camelcasemotion'

	" php specific {
		Bundle 'spf13/PIV'
	" }
" }

	" colorschemes {
	Bundle 'tomasr/molokai'
	Bundle 'altercation/vim-colors-solarized'
	" } colorschemes
" }

filetype plugin indent on
"}
