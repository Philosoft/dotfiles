" complex {
let mapleader = "," " this needs to be here - above all mappings
" }

let s:vim_home = '~/.vim/'

let config_list = [
	\ 'plugins.vim',
	\ 'theme.vim',
	\ 'menu.vim',
	\ 'settings.vim',
	\ 'leader.vim',
	\ 'generic_mappings.vim',
	\ 'languages.vim',
	\ 'plugins_settings/*.vim',
	\ 'filetypes/*.vim'
\]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor
endfor

" hostname-specific config
let hostfile = $HOME . '/.vim/vimrc-' . substitute(hostname(), "\\..*", "", "")
if filereadable(hostfile)
  exe 'source ' . hostfile
endif

"=== Some opts === {
set autochdir "Автоматически менять каталог
set novisualbell
set t_vb=
set confirm "Диалоги вместо сообщений об ошибках

set spelllang=en,ru " Языки для проверки правописания
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8 
" Позволяет передвигаться по пустым строкам
set virtualedit=block
"}

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent
"set smartindent
inoremap # X#
"backspace стирает отступ и перевод строки
set backspace=indent,eol,start
""}

" включает поддержку строк вида vim:st=2‥
set modeline

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
set magic
"}

"=== История ==={
set history=100
set viminfo+=h "Сохранять историю
"}

set sessionoptions-=blank "Не сохранять пустые окна

"Изменяемые размеры окон
set modifiable

function! ToggleNumbering()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

" commands {
" command Thtml :%!tidy -utf8 -q -i --show-errors 0 "Tidy up hmtl in current buffer
" }

" autocommands {
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
" }

let b:did_indent = 1 " psr-1 and 4 space-indent sucks
"set iskeyword+=- " append - to keyword so -separated vars would work
if has('unnamedplus')
	set clipboard+=unnamedplus,unnamed
else
	set clipboard+=unnamed
endif
