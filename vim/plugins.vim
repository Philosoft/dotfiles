"=== Vundle plugins === {
" set nocompatible isn't neccesary when vim load settings from g?vimrc
filetype off
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" == bundles == {
	" = examples {
	" original repos on github
	" NeoBundle 'tpop/vim-fugitive'
	" vim-script repos
	" NeoBundle 'FuzzyFinder'
	" non git-hub repos
	" NeoBundle 'git://git.blah.com/lol.git
	" }
	"
	NeoBundleFetch "Shougo/neobundle.vim"
	NeoBundle "Shougo/vimproc.vim"

	NeoBundle 'vim-scripts/bufexplorer.zip'
	NeoBundle 'L9'
	NeoBundle 'itchyny/lightline.vim'
	NeoBundle 'kshenoy/vim-signature'
	NeoBundle 'osyo-manga/vim-over'
	NeoBundle 'tpope/vim-unimpaired'
	"
	" vim enhanchments {
	NeoBundle 'mhinz/vim-startify'
	"" }
	"
	" programming helpers {

	" NeoBundle "Valloric/YouCompleteMe.git"
	" NeoBundle 'honza/vim-snippets'
	" NeoBundle 'kien/ctrlp.vim'
	NeoBundle "Shougo/unite.vim"
	NeoBundle 'Raimondi/delimitMate'
	NeoBundle 'SirVer/ultisnips'
	NeoBundle 'jakobwesthoff/whitespacetrail'
	NeoBundle 'kien/rainbow_parentheses.vim'
	NeoBundle 'majutsushi/tagbar'
	NeoBundle 'mattn/emmet-vim'
	NeoBundle 'mattn/livestyle-vim'
	NeoBundle 'mileszs/ack.vim'
	NeoBundle 'nathanaelkane/vim-indent-guides'
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'sjl/gundo.vim'
	NeoBundle 'tmhedberg/matchit'
	NeoBundle 'tomtom/tcomment_vim'
	NeoBundle 'tpope/vim-abolish'
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'tpope/vim-surround'
	NeoBundle 'vim-scripts/camelcasemotion'

	" php specific {
		NeoBundle 'spf13/PIV'
	" }
	
	" html {
	NeoBundle 'othree/html5.vim'
	NeoBundle 'Valloric/MatchTagAlways'
	" }
	" less {
	NeoBundle 'groenewege/vim-less'
	" }
" }

	" colorschemes {
	NeoBundle 'tomasr/molokai'
	NeoBundle 'altercation/vim-colors-solarized'
	NeoBundle 'nanotech/jellybeans.vim'
	NeoBundle 'chriskempson/tomorrow-theme', {
				\ 'rtp': 'vim',
				\ }
	" } colorschemes
	
	NeoBundle "kien/tabman.vim"
	NeoBundle "tpope/vim-repeat"
" }

filetype plugin indent on

NeoBundleCheck
"}
