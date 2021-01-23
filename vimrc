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
Bundle 'andreashug/vim-lunarized'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'rbgrouleff/bclose.vim'

" Tools
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'
Bundle 'vimoutliner/vimoutliner'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'kamykn/spelunker.vim'
Bundle 'Yggdroot/LeaderF'
Bundle 'majutsushi/tagbar'

" Programming
Bundle 'tpope/vim-surround'
Bundle 'Jinja'
Bundle 'davidhalter/jedi-vim'
Bundle 'fisadev/vim-isort'
Bundle 'scrooloose/syntastic'
Bundle 'psf/black'
Bundle 'pearofducks/ansible-vim'
Bundle 'fatih/vim-go'
Bundle 'cespare/vim-toml'

if vundle_needs_install == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin on
filetype indent on

syntax on

let g:lunarized_export = 1
colorscheme lunarized

set encoding=utf-8
set fileencoding=utf-8

set backspace=indent,eol,start

set softtabstop=0			" number of spaces that a tab counts while editing
set tabstop=4               " default tab width
set shiftwidth=4            " default tab width when shifting
set formatoptions-=t

set hidden                  " allow modified buffers to be hidden
set ttyfast

set hlsearch                " highlight the last searched term
set incsearch
set ignorecase
set smartcase

set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.

set number                  " line numbers
set ruler                   " show the cursor position
set wildmenu                " show menu for command completion
set history=100             " keep 100 lines of history
set noshowmode              " Don't show mode in statusline

set autowrite

set modeline
set modelines=10

set guioptions-=L
set guioptions-=r

set fillchars+=vert:│

" BufExplorer
nmap <F2> :BufExplorer<CR>
let g:bufExplorerShowRelativePath=1
let g:bufExplorerDisableDefaultKeyMapping=1

" Tagbar
nnoremap <silent> <F12> :TagbarOpenAutoClose<CR>
nnoremap <silent> <S-F12> :TagbarOpen fj<CR>

" Deactivat highlights
nnoremap <silent> <leader>h :nohl<CR>

" Folding
set foldmethod=indent
set foldlevel=99

" Toggle whitespace
set listchars=tab:>-,trail:·
nmap <silent> <leader>. :set nolist!<CR>

" Spelling
nnoremap <silent> <leader>se :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <leader>sd :setlocal spell spelllang=de_de<CR>
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

" Cursor
set guicursor+=a:blinkon0

" Quickfix full width
autocmd filetype qf wincmd J

" OmniComplete
set completeopt=menuone,longest
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1

" Bclose
let g:bclose_no_plugin_maps = 1

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

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_preserve_formatoptions = 1

" LeaderF
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowHeight = 15
let g:Lf_CacheDirectory = $HOME."/.cache"
let g:Lf_DisableStl = 1
nnoremap <leader>t :LeaderfTag<CR>
nnoremap <leader>b :LeaderfBufTag<CR>
nnoremap <leader>r :<C-U><C-R>=printf("Leaderf! rg -w -e %s ", expand("<cword>"))<CR><CR>
nnoremap <C-F> :LeaderfRgInteractive<CR>
nnoremap <C-S-F> :Leaderf! rg -e<Space>

" UltiSnips
let g:UltiSnipsSnippetDirectories = ["ultisnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

" Surrond shortcuts
nmap <leader>' ysiw'
nmap <leader>" ysiw"

" Spelunker
let g:enable_spelunker_vim = 0
let g:spelunker_white_list_for_user = []

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<leader>jc"
let g:jedi#goto_command = "<F4>"
let g:jedi#goto_assignments_command = ""
let g:jedi#documentation_command = "<F1>"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#show_call_signatures = 2

" Go
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8', 'python']

" Isort
autocmd FileType python nnoremap <F3> :Isort<CR>

" Black
let g:black_virtualenv = "~/.vim/bundle/black/venv"

" Tags
set tags=.git/tags,.tags
set notagrelative

" Python
autocmd FileType python setlocal expandtab
py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
    venv = os.getenv('VIRTUAL_ENV')
    site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'), None)
    if site_packages:
        sys.path.insert(0, str(site_packages))
EOF

" Git commit
autocmd FileType gitcommit setlocal spell spelllang=en_us

" ReStructured Text
autocmd FileType rst setlocal textwidth=72 formatoptions-=l wrapmargin=0

" HTML/CSS/JS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal noexpandtab
autocmd FileType css setlocal noexpandtab
autocmd FileType javascript setlocal noexpandtab


" Use X11 clipboard
if has('unix')
	set clipboard=unnamedplus
endif
