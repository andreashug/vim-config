# Vim Config

## Setup

Clone this repository to `$XDG_CONFIG_HOME/vim` or `$HOME/.vim`
and create a `vimrc` in this directory.

Download the plug-in manager`vim-plug`.

```bash
curl -fLo autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Config

This is the recommended template for `vimrc`:

```vim
" Load Vim defaults first
runtime defaults.vim

" Plugins come next
runtime config/plugins.vim

" Set colorscheme
set background=dark
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
runtime config/misc.vim
runtime config/spelling.vim
```
