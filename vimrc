"=== Vundle === {
set nocompatible
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
Bundle 'gmarik/vundle'
Bundle 'kshenoy/vim-signature'
Bundle 'python.vim'
Bundle 'vimwiki'
Bundle 'L9'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'bling/vim-airline'

Bundle 'weierophinney/paster.vim'
Bundle 'groenewege/vim-less'

" vim enhanchments {
Bundle 'mhinz/vim-startify'
" }

" programming helpers {
"Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tmhedberg/matchit'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
" }
Bundle 'Lokaltog/vim-easymotion'

" colorschemes {
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
" } colorschemes
" }

filetype plugin indent on
"}
"=== Внешний вид === {
set nu
syn on
set foldenable
set lazyredraw " не показывать выполнение макросов
"set fdm=indent
"set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Разный фон для gui и консоли   
if has("gui_running")
	set guifont=Monaco
	let g:molokai_original=1 " just in case we want to change colorscheme in runtime
	set guioptions+=LlRrb guioptions-=LlRrb " remove scrollbars
	set guioptions-=m
	set guioptions-=T
	colorscheme molokai
	set bg=dark
	" Используем символы как в TextMate для табуляции и конца строки
	set listchars=tab:▸·,eol:¬,extends:»,precedes:«
	set list
	set showbreak=↪
	
	" vim-airline {
	let g:airline_enable_branch=1
	let g:airline_branch_prefix=1
	let g:airline_enable_syntastic=1
	let g:airline_theme='molokai'
  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_linecolumn_prefix = '␊ '
  let g:airline_linecolumn_prefix = '␤ '
  let g:airline_linecolumn_prefix = '¶ '
  let g:airline_branch_prefix = '⎇ '
  let g:airline_paste_symbol = 'ρ'
  let g:airline_paste_symbol = 'Þ'
  let g:airline_paste_symbol = '∥'
	" }
else
    set bg=dark
endif
"256 цветов
set t_Co=256
"}

"=== Some opts === {
set autochdir "Автоматически менять каталог
set nocompatible
set novisualbell
set t_vb=
set confirm "Диалоги вместо сообщений об ошибках
"set clipboard+=unnamed " share windows clipboard
set clipboard=unnamedplus,unnamed,exclude:cons\|linux
"default clipboard=autoselect,exclude:cons\|linux,unnamed

set spelllang=en,ru          " Языки для проверки правописания
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8 
" Позволяет передвигаться по пустым строкам
set virtualedit=block
"}

filetype on
filetype plugin on
filetype indent on
"=== Dirs === {
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/tmp/
set undodir=~/.vim/undo/
let g:session_dir='~/.vim/sessions/'
""}

" undos {
set undofile
" }

""=== Оступы === {
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set noexpandtab
set shiftround
set autoindent
set smartindent
inoremap # X#
"backspace стирает отступ и перевод строки
set backspace=indent,eol,start
"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸·,eol:¬
set list
set showbreak=↪
""}

" включает поддержку строк вида vim:st=2‥
set modeline

" переключение между буферами
" nmap <c-p> :bp<CR>
" nmap <c-n> :bn<CR>

""=== Прокрутка === {
""set scrolloff=7
""set scrolljump=7
""set sidescrolloff=7
""set sidescroll=1
""}

"=== Поиск === {
set incsearch "поиск по мере набора
set hlsearch  "подсвечивать результаты
set ignorecase
set smartcase "Игнорировать предыдущую опцию, если в строке поиска присутствуют символы разного регистра
"}

"=== История ==={
set history=100
set viminfo+=h "Сохранять историю
"}

"=== Строка статуса и командная строка === {
set laststatus=2 "Всегда отображать статусную строку для каждого окна
set shortmess=atToOI
set showcmd
set showmode
set statusline=%<%f%h%m%{fugitive#statusline(5)}
set statusline+=%#Error#%r%*%=
set statusline+=\ type=%Y
set statusline+=\ Line:\ %l/%L 
set wildmenu                " использовать wildmenu ...
set wildcharm=<TAB>         " ... с авто-дополнением
set cmdheight=2             " Command line height 2 
"}

set sessionoptions-=blank "Не сохранять пустые окна

nmap <leader>\ :nohl<cr>

"Изменяемые размеры окон
set modifiable

"=== Разметка клавиш === {{{
map ц W
"}}}

"=== Плагины === {{{
" Python.vim
let python_highlight_all=1

"autocmd FileType python set omnifunc=pythoncomplete#Complete
"}}}


" {{{ nmapings
nmap р h
nmap о j
nmap л k
nmap д l

nmap ц w
nmap Ц W
nmap и b
nmap И b
nmap а f
nmap А F

" mappings {
map <leader>hs :nohl<CR>
" }
"
"
" Меню Encoding -->
" Выбор кодировки, в которой читать файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
map <F8> :emenu Encoding.Read.<TAB>
" Выбор кодировки, в которой читать файл <--

" Выбор кодировки, в которой сохранять файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
map <S-F7> :emenu Encoding.Write.<TAB>
" Выбор кодировки, в которой сохранять файл <--

" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
set wildmenu
set wcm=<Tab>
menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
map <C-F7> :emenu Encoding.End_line_format.<TAB>
" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
" Меню Encoding <--

" Mappings {
" zencoding
vmap <C-l> <C-y>,ul>li*<CR>
vmap <C-p> <C-y>,p*<CR>
vmap <C-o> <C-y>,p[style="font-weight: bold;"]<CR>
" разметить тегами и загрузить в иксовый буфер
" nmap <C-l> ggVG<C-y>,ul>li*<CR>ggVGdi
" nmap <C-p> ggVG<C-y>,p*<CR>ggVGdi

imap <C-l> <ESC>ggVG<C-y>,ul>li*<CR>ggVGdi
"imap <C-p> <ESC>ggVG<C-y>,p*<CR>ggVGdi
imap <C-a> <ESC>ggVG<C-y>,ul>li*<CR>ggVGdi
imap <C-e> <ESC>gg0<C-v>GlxggVG<C-y>,ul>li*<CR>ggVGdi
imap <C-q> <ESC>ggVG<C-y>,p*<CR>ggVGdi

nmap <C-t> f+vt.<C-y>,span[style="font-weight: bold;"]<CR>

nmap Ж :

nmap т n
nmap Т N
" }}}

" {{{
imap <C-ц> <C-w>
" }}}

function! ToggleNumbering()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <leader>r :call ToggleNumbering()<CR>
" tagbar {
"let g:tagbar_left=1
nnoremap <silent> <F9> :TagbarToggle<CR>
" }

nnoremap <F5> :GundoToggle<CR>
" NERDTree {
map <F2> :NERDTreeToggle<CR>
" }
"
" supertab {
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
"}

" commands {

"command Thtml :%!tidy -q -i --show-errors 0 "Tidy up hmtl in current buffer

" abbreviations {
" iab ipip if ( $_SERVER['REMOTE_ADDR'] == '77.93.125.96' ) {<CR>}<Esc>Oecho "<!--DEBUG\n";<CR>echo "/DEBUG -->\n";<Esc>O
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
" }

" autocommands {
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
" }

let g:syntastic_oho_checkers=['php']
