noremap \ , " coz , is leader @ work

map <leader>hs :nohl<CR>
nmap <leader>, :nohl<cr>

nnoremap <leader>r :call ToggleNumbering()<CR>

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" tab controls like gtk+ defaults {
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
" }

" GUI {
"" normal mode {
nnoremap <C-a> ggVG
"" }

"" visual mode {
vnoremap <C-a> ggVG
vnoremap <C-c> "+y
"" }

"" insert mode {
imap <C-v> "+pa
"" }
" }
