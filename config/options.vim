set hidden                  " allow modified buffers to be hidden

set number                  " show line numbers
set ruler                   " show the cursor position
set history=100             " keep 100 lines of history
set wildmenu                " show command completion
set wildoptions=pum         " command completion in popup
set hidden                  " allow modified buffers to be hidden

set hlsearch                " highlight the last searched term
set incsearch
set ignorecase
set smartcase

set backspace=indent,eol,start

" Lines at beginning and ending of file are checked for config instructions
set modeline
set modelines=5

" Minimum number of lines to show when scrolling vertically
set scrolloff=5

" Number of columns to scroll horizontally
set sidescroll=1

" Minimum number of columns to show when scrolling horizontally
set sidescrolloff=2

set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.

" Vertical line between windows
set fillchars+=vert:│      

" Config characters in list mode
set listchars=tab:>-,trail:·

" Hide sign column if there are no signs
set signcolumn=auto

" GUI options
set guioptions-=m  " Deactivate menu bar
set guioptions-=T  " Deactivate button bar
set guioptions-=L  " Deactivate left scrollbar
set guioptions-=r  " Deactivate right scrollbar

" Deactivate cursor blinking in all modes
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

" ANSI codes for start/end undercurl
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
