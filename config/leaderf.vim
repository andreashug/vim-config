let g:Lf_ShowDevIcons = 0
let g:Lf_WindowHeight = 15
let g:Lf_CacheDirectory = $HOME . "/.cache"
let g:Lf_DisableStl = 1
let g:Lf_PreviewResult = {
    \ 'File': 0,
    \ 'Buffer': 0,
    \ 'Mru': 1,
    \ 'Tag': 1,
    \ 'BufTag': 1,
    \ 'Function': 1,
    \ 'Line': 1,
    \ 'Colorscheme': 1,
    \ 'Rg': 1,
    \ 'Gtags': 1
    \}

nnoremap <C-SPACE> :Leaderf buffer<CR>
nnoremap <leader>t :Leaderf tag<CR>
nnoremap <leader>b :Leaderf bufTag<CR>
nnoremap <leader>w :<C-U><C-R>=printf("Leaderf! --stayOpen rg -w -e %s ", expand("<cword>"))<CR><CR>
nnoremap <leader>g :Leaderf! --stayOpen rg -e<Space>
nnoremap <leader>F :Leaderf file --no-ignore<CR>
