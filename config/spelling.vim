" Create and set spell directory
let s:spell_dir = $XDG_STATE_HOME .. '/vim/spell/'
call mkdir(s:spell_dir, 'p')


" Spelling
nnoremap <silent> <leader>se :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <leader>sd :setlocal spell spelllang=de_de<CR>
nnoremap <silent> <leader>sn :setlocal nospell<CR>

" Set the local spell file according to the language
augroup spelling_config
	au!
	au OptionSet spell exec printf(
		\ 'setlocal spellfile=%s%s.%s.add',
		\ s:spell_dir, &spelllang, &encoding
		\ )
augroup END
