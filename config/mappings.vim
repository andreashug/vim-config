" Deactivate highlights
nnoremap <silent> <leader>h :nohl<CR>

" Unmap `only` command
noremap <c-w>o <NOP>
noremap <c-w><c-o> <NOP>

" Unmap suspending
nnoremap <c-z> <NOP>
vnoremap <c-z> <NOP>

" Save on ctrl-s and leader-s
nnoremap <c-s> :w<CR>
nnoremap <leader>s :w<CR>


" Toggle list mode (show symbols for tab, space, etc.)
nnoremap <silent> <leader>. :set nolist!<CR>

" Swap behavior of p and P in visual mode (don't replace text in register on p)
xnoremap p P
xnoremap P p

" Copy the current file name to the clipboard
nnoremap <silent> <c-f> :let @+ = expand("%:.")<CR>

" Delete (close) current buffer
nnoremap <silent> <c-q> :Bdelete<CR>

" Open path from clipboard
nnoremap <c-e> :call ClipboardOpen()<CR>
