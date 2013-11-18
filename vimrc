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
	\ 'keymappings.vim',
	\ 'languages.vim',
	\ 'plugin_settings/*.vim'
\]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor
endfor

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set noexpandtab
set shiftround
set autoindent
"set smartindent
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
set magic
"}

"=== История ==={
set history=100
set viminfo+=h "Сохранять историю
"}

set sessionoptions-=blank "Не сохранять пустые окна

nmap <leader>, :nohl<cr>

"Изменяемые размеры окон
set modifiable

" mappings {
map <leader>hs :nohl<CR>
" }

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

" commands {
" command Thtml :%!tidy -utf8 -q -i --show-errors 0 "Tidy up hmtl in current buffer
" }

" autocommands {
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" autocmd BufRead *.php :IndentGuidesEnable
autocmd BufRead *.less :set ft=less.css
" }

let b:did_indent = 1 " psr-1 and 4 space-indent sucks

" vimOver
nnoremap <leader>s :OverCommandLine<cr>
