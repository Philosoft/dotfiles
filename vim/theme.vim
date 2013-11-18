"=== Внешний вид === {
set nu
syn on
set foldenable
set lazyredraw " не показывать выполнение макросов

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸·,eol:¬
set list
set showbreak=↪

"Разный фон для gui и консоли
if has("gui_running")
	set guioptions+=LlRrb guioptions-=LlRrb " remove scrollbars
	set guioptions-=m " remove menu
	set guioptions-=T " remove toolbar

	set guifont=Monaco
	set guitablabel=[%N]\ %m%t " [tabNum] modified? filename
	let g:molokai_original=1 " just in case we want to change colorscheme in runtime

	colorscheme solarized
	set bg=light

	" Используем символы как в TextMate для табуляции и конца строки {
	set listchars=tab:▸·,eol:¬,extends:»,precedes:«
	set list
	set showbreak=↪
	" }
else
    set bg=dark
endif
"256 цветов
set t_Co=256
" }

"=== Строка статуса и командная строка === {
set laststatus=2 "Всегда отображать статусную строку для каждого окна
set shortmess=atToOI
set showcmd
set showmode
set statusline=%<%f%h%m%{fugitive#statusline(5)}
set statusline+=%#Error#%r%*%=
set statusline+=\ type=%Y
set statusline+=\ Line:\ %l/%L 
set wildmenu        " использовать wildmenu ...
set wildcharm=<TAB> " ... с авто-дополнением
set cmdheight=2     " Command line height 2 
" }
