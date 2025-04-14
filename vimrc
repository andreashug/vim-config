" Load Vim defaults first
runtime defaults.vim

" Plugins come next
runtime config/plugins.vim

" Set colorscheme
colorscheme lunarized

" All remaining config
runtime config/options.vim
runtime config/mappings.vim
runtime config/highlight.vim
runtime config/ale.vim
runtime config/statusline.vim
runtime config/autocomplete.vim
runtime config/leaderf.vim
runtime config/vimlsp.vim
runtime config/nerdtree.vim
