" Deactivate highlights
nnoremap <silent> <leader>h :nohl<CR>

" Unmap `only` command
noremap <c-w>o <NOP>
noremap <c-w><c-o> <NOP>

" Save on ctrl-s and leader-s
nnoremap <c-s> :w<CR>
nnoremap <leader>s :w<CR>


" Toggle list mode (show symbols for tab, space, etc.)
nnoremap <silent> <leader>. :set nolist!<CR>

" Swap behavior of p and P in visual mode (don't replace text in register on p)
xnoremap p P
xnoremap P p

" Spelling
nnoremap <silent> <leader>se :setlocal spell spelllang=en_us spellfile=.vimspell/en.utf-8.add,$HOME/.vim/spell/en.utf-8.add<CR>
nnoremap <silent> <leader>sd :setlocal spell spelllang=de_de spellfile=.vimspell/de.utf-8.add,$HOME/.vim/spell/de.utf-8.add<CR>
nnoremap <silent> <leader>sn :set nospell<CR>
