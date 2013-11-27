" settings {
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" let's track our yanking
let g:unite_source_history_yank_enable = 1
" let's be more xdg-friendly
let g:unite_data_directory = expand('~/.cache/.unite')

" if we have ack we should use it ;)
if executable('ack-grep')
	let g:unite_source_grep_command = 'ack-grep'
	let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
	let g:unite_source_grep_recursive_opt = ''
endif

" }

" mappings {
nnoremap <c-p> :<C-u>Unite -no-split -start-insert file_rec/async:!<cr>
nnoremap <c-b> :<C-u>Unite -no-split -start-insert buffer<cr>

nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>

	" unite itself {
		" overwrite some of defaults or/and add my own
		autocmd FileType unite call s:unite_my_settings()
		function! s:unite_my_settings() " {
			nmap <buffer> <ESC> <Plug>(unite_exit)
			
			imap <buffer> <c-j> <plug>(unite_select_next_line)
			imap <buffer> <c-k> <plug>(unite_select_previous_line)

			" splits
			imap <silent><buffer><expr> <C-s> unite#do_action('split')
			imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
			imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

			" F5 for flush cache
			imap <buffer> <F5> <Plug>(unite_redraw)
		endfunction " }
	" }
" }
