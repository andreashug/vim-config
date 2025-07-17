" Tabs are 2 spaces wide
setlocal tabstop=2

" Use tabstop when indenting with >> / <<
setlocal shiftwidth=0

let b:ale_fixers = ['djlint', 'remove_trailing_lines', 'trim_whitespace']
