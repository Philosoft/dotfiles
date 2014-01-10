let g:user_emmet_settings = {
	\ 'lang' : 'ru',
	\ 'html' : {
	\   'filters' : 'html',
	\ },
	\ 'php' : {
	\   'extends' : 'html',
	\   'filters' : 'html,c',
	\ },
	\ 'css' : {
	\   'filters' : 'fc',
	\ },
	\ 'less' : {
	\   'extends' : 'css',
	\ },
\ }

nmap <C-h> V<C-y>,h2<CR>3J:.s/> \+/>/g<CR>:.s/ \+</</g<CR>:nohlsearch<CR>
vmap <C-t> <C-y>,tr>td*<CR>
nmap <C-t> Vj<C-y>,tr>td*<CR>4j
vmap <C-l> <C-y>,ul>li*<CR>
vmap <C-p> <C-y>,p*<CR>
