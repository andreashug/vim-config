function AleStatusLine() abort
	try
		let l:counts = ale#statusline#Count(bufnr(''))
	catch /^Vim\%((\a\+)\)\=:E117:/
		" E117 - Unknown function
		return ''
	endtry

	if l:counts.total == 0
		return ''
	else
		let l:errors = l:counts.error + l:counts.style_error
		let l:warnings = l:counts.warning + l:counts.style_warning
		return printf(' [%d ■ | %d ▲ | %d ●]', l:errors, l:warnings, l:counts.info)
	endif
endfunction

" Always show statusline
set laststatus=2            

" File name
set statusline=%.50f
" Encoding / line endings
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]
" File type
set statusline+=\ %y
" Ale
set statusline+=\%{AleStatusLine()}
" Modified
set statusline+=\ %m
" Readonly 
set statusline+=\ %r
" Continue right aligned 
set statusline+=%=
" column, line, lines
set statusline+=%c,%l/%L
