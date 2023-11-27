call plug#begin('~/.vim-test/plugged')
Plug 'preservim/nerdtree'
Plug 'andreashug/vim-lunarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/LeaderF'

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'ervandew/supertab'
call plug#end()

let g:lunarized_export = 1
colorscheme lunarized


set hidden                  " allow modified buffers to be hidden

set number                  " show line numbers
set ruler                   " show the cursor position
set history=100             " keep 100 lines of history
set wildmenu                " show menu for command completion
set hidden                  " allow modified buffers to be hidden

set hlsearch                " highlight the last searched term
set incsearch
set ignorecase
set smartcase

" Deactivate highlights
nnoremap <silent> <leader>h :nohl<CR>

set noshowmode              " Don't show mode in statusline

set backspace=indent,eol,start

" Lines at beginning and ending of file are checked for config instructions
set modeline
set modelines=5


set backupdir=~/.vim-test/tmp//,.
set directory=~/.vim-test/tmp//,.

set fillchars+=vert:│       " vertical line between windows


set guioptions-=L           " deactivate left scrollbar
set guioptions-=r           " deactivate right scrollbar

" Toggle whitespace
set listchars=tab:>-,trail:·
nmap <silent> <leader>. :set nolist!<CR>


" Spelling
nnoremap <silent> <leader>se :setlocal spell spelllang=en_us spellfile=.vimspell/en.utf-8.add,$HOME/.vim/spell/en.utf-8.add<CR>
nnoremap <silent> <leader>sd :setlocal spell spelllang=de_de spellfile=.vimspell/de.utf-8.add,$HOME/.vim/spell/de.utf-8.add<CR>
nnoremap <silent> <leader>sn :set nospell<CR>

" Statusline file name, encoding, file format, modified, readonly | column, line, lines
set statusline=%.50f
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]
set statusline+=\ %y
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=%c,%l/%L
set laststatus=2            " Always show statusline


set guicursor+=a:blinkon0

" Auto relaod changed files
set autoread


" Tags
set tags=.git/tags,.tags
set notagrelative


" Use X11 clipboard
if has('unix')
	set clipboard=unnamedplus
endif

" AUTOCOMPLETE

" Don't show the auto complete popup automatically
let g:asyncomplete_auto_popup = 0

" Prevent asyncomplete from overwriting completeopt an set it manually
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect

" Let supertab call omni complete (lsp#complete)
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCrMapping = 1

imap <C-P> <Plug>(asyncomplete_force_refresh)

au User lsp_setup call lsp#register_server({
	\ 'name': 'pylsp',
	\ 'cmd': {server_info->['pylsp']},
	\ 'allowlist': ['python'],
	\ 'workspace_config': {'pylsp': {'plugins': {
	    \ 'ruff': {'enabled': v:true, 'extendSelect': 'I'},
	    \ 'black': {'enabled': v:false},
	    \ 'rope_autoimport': {'enabled': v:true}
	    \ }}}
	\ })

"au User lsp_setup call lsp#register_server({
"	\ 'name': 'rufflsp',
"	\ 'cmd': {server_info->['ruff-lsp']},
"	\ 'allowlist': ['python'],
"	\ })


let g:lsp_preview_float = 1
let g:lsp_async_completion = 1
let g:lsp_completion_documentation_delay = 500
let g:lsp_diagnostics_echo_cursor = 1  " show hint below status bar
let g:lsp_document_highlight_enabled = 0  " don't highlight reference to word under cursor
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
"let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_error = {'text': '❗'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}
let g:lsp_diagnostics_signs_hint = {'text': '💡'}
let g:lsp_diagnostics_signs_information = {'text': '🔍'}

highlight PopupWindow guifg=#909090 guibg=#1b1b1b
augroup lsp_float_colours
	" lsp#document_hover_preview_winid = lsp-hover
	" lsp#ui#vim#output#getpreviewwinid = preview when typing
	autocmd!
	autocmd User lsp_float_opened
		\ call setwinvar(lsp#document_hover_preview_winid(), '&wincolor', 'PopupWindow')
	autocmd User lsp_float_opened
		\ call setwinvar(lsp#ui#vim#output#getpreviewwinid(), '&wincolor', 'PopupWindow')
	"autocmd User lsp_float_opened
		"\ call popup_setoptions(lsp#document_hover_preview_winid(), {'borderchars': ['─', '.', '─', '.', '┌', '┐', '┘', '└']})
	"autocmd User lsp_float_opened
		"\ call popup_setoptions(lsp#ui#vim#output#getpreviewwinid(), {'borderchars': ['─', '.', '─', '.', '┌', '┐', '┘', '└']})
augroup end


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=auto
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <F2> <plug>(lsp-hover)
    nmap <buffer> <F3> <plug>(lsp-references)
    nmap <buffer> <F4> <plug>(lsp-definition)
    nmap <buffer> <F5> <plug>(lsp-code-action)
    nmap <buffer> <c-b> <plug>(lsp-document-format)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000

    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" NERDTree
nnoremap <silent> <F11> :NERDTreeFind<CR>
nnoremap <silent> <S-F11> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__', 'egg-info', 'node_modules']
let NERDTreeRespectWildIgnore = 1
let NERDTreeStatusline = 'NerdTree'
let NERDTreeAutoDeleteBuffer = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('gui_running')
	augroup nerdtree
		autocmd vimenter * NERDTree
		autocmd vimenter * wincmd w
	augroup END
endif


" LeaderF
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowHeight = 15
let g:Lf_CacheDirectory = $HOME."/.cache"
let g:Lf_DisableStl = 1
let g:Lf_PreviewInPopup = 0
nnoremap <C-SPACE> :Leaderf buffer<CR>
nnoremap <leader>r :Leaderf! buffer<CR>
nnoremap <leader>t :Leaderf tag<CR>
nnoremap <leader>b :Leaderf bufTag<CR>
nnoremap <leader>w :<C-U><C-R>=printf("Leaderf! --stayOpen rg -w -e %s ", expand("<cword>"))<CR><CR>
nnoremap <leader>g :Leaderf! --stayOpen rg -e<Space>
nnoremap <leader>af :Leaderf file --no-ignore<CR>
nnoremap <C-F> :LeaderfRgInteractive<CR>
autocmd WinEnter */Buffer/LeaderF resize 25

" UltiSnips
let g:UltiSnipsSnippetDirectories = ["ultisnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
