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
