"=== Внешний вид === {
set nu
syn on
set foldenable
set fdm=indent
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Разный фон для gui и консоли   
if has("gui_running")
    set bg=light
    colorscheme desert
else
    set bg=dark
endif
"256 цветов
set t_Co=256
"}

"=== Some opts === {
set autochdir "Автоматически менять каталог
set nocompatible
set visualbell
set t_vb=
set confirm "Диалоги вместо сообщений об ошибках
set clipboard+=unnamed " share windows clipboard

set spelllang=en,ru          " Языки для проверки правописания
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8 
" Позволяет передвигаться по постым строкам
set virtualedit=all
"}

filetype on
filetype plugin on
filetype indent on
"=== Dirs === {
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/tmp/
let g:session_dir='~/.vim/sessions/'
""}

""=== Оступы === {
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set expandtab
set shiftround
set ai
set smartindent
"backspace стирает отступ и перевод строки
set backspace=indent,eol,start
""}

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
set history=20
set viminfo+=h "Сохранять историю
"}

"=== Строка статуса и командная строка === {
set laststatus=2 "Всегда отображать статусную строку для каждого окна
set shortmess=atToOI
set showcmd
set showmode
set statusline=%<%f%h%m
set statusline+=%#Error#%r%*%=
set statusline+=\ type=%Y
set statusline+=\ format=%{&fileformat}
set statusline+=\ file=%{&fileencoding}
set statusline+=\ enc=%{&encoding}
set statusline+=\ %b\ 0x%B\ %l,%c%V\ %P
set wildmenu                " использовать wildmenu ...
set wildcharm=<TAB>         " ... с авто-дополнением
set cmdheight=2             " Command line height 2 
"}

set sessionoptions-=blank "Не сохранять пустые окна

"Изменяемые размеры окон
set modifiable

"=== Разметка клавиш === {{{
map ц W
"}}}

"=== Плагины === {{{
"vimwiki
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'xml': 'xml', 'vim': 'vim', 'c': 'c', 'config': 'config', 'lua': 'lua'}
let g:vimwiki_list = [wiki]
let g:vimwiki_list = [{'html_header': '~/vimwiki_html/syntax_hl/header.tpl'}]
let g:vimwiki_list = [{'path_html': '~/vimwiki_html'}]

" Python.vim
let python_highlight_all=1

"autocmd FileType python set omnifunc=pythoncomplete#Complete

"latex-suite
set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"set iskeyword+=:
"}}}
