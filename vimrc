set nocompatible              " be iMproved

let vundle_needs_install=1
if !filereadable(expand('~/.vim/bundle/vundle/README.md'))
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundle_needs_install=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" System
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'rbgrouleff/bclose.vim'

" Tools
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'
Bundle 'vimoutliner/vimoutliner'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'kien/ctrlp.vim'

" Programming
Bundle 'jimenezrick/vimerl'
Bundle 'tpope/vim-surround'
Bundle 'Jinja'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/syntastic'

if vundle_needs_install == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin on
filetype indent on

syntax on

set encoding=utf-8
set fileencoding=utf-8

set backspace=indent,eol,start

set softtabstop=0			" number of spaces that a tab counts while editing
set tabstop=4               " default tab width
set shiftwidth=4            " default tab width when shifting

set hidden                  " allow modified buffers to be hidden
set ttyfast

set hlsearch                " highlight the last searched term
set incsearch
set ignorecase
set smartcase

set backupdir=~/.vim/tmp,.  " backup directories
set directory=~/.vim/tmp,.  " swapfile directories

set number                  " line numbers
set ruler                   " show the cursor position
set wildmenu                " show menu for command completion
set history=100             " keep 100 lines of history

set modeline
set modelines=10

" BufExplorer
nmap <F2> :BufExplorer<CR>

" Deactivat highlights
nnoremap <silent> <leader>h :nohl<CR>

" Folding
set foldmethod=indent
set foldlevel=99

" Toggle whitespace
set listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" Spelling
nnoremap <silent> <leader>en :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <leader>de :setlocal spell spelllang=de_de<CR>
nnoremap <silent> <leader>ns :set nospell<CR>

" OmniComplete
set completeopt=menuone,longest
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__', 'egg-info', 'node_modules']
let NERDTreeRespectWildIgnore = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" CtrlP
nnoremap <C-Space> :CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules$\|egg-info$\|__pycache__$',
  \ 'files': '\.pyc\|\~$',
  \ }

" Ack
nnoremap <leader>a :Ack!<Space>

" UltiSnips
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"

" Bclose
nnoremap <silent> <leader>d :Bclose<CR>

" Surrond shortcuts
nmap <leader>' ysiw'
nmap <leader>" ysiw"

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<F4>"
let g:jedi#documentation_command = "<F3>"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

" Python
autocmd FileType python setlocal expandtab

" Erlang
let erlang_show_errors = 0

" ReStructured Text
autocmd FileType rst setlocal textwidth=72 formatoptions-=l wrapmargin=0

" HTML/CSS/JS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal noexpandtab
autocmd FileType css setlocal noexpandtab
autocmd FileType javascript setlocal noexpandtab

" JSON
autocmd BufNewFile,BufRead *.json set ft=javascript

" Solarized theme
if has('gui_running') || $TERM_PROGRAM == "iTerm.app"
	set background=dark
	colorscheme solarized
endif

highlight ExtraWhitespace ctermbg=darkred guibg=#382424
