" Always show menu, don't insert automatically, show additional info in popup
set completeopt=menuone,noinsert,popup

" Max height of suggestion list
set pumheight=20

" Use control + j/k to navigate autocomplete
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

" Global supertab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1
let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabContextCompleteMemberPatterns = []


" Configure contexts for Python files
augroup supertab_python_context
	au!
	au FileType python call s:SuperTabPythonContext()
augroup END

function s:SuperTabPythonContext()
	let b:SuperTabContextDefaultCompletionType = "<c-x><c-u>"
	let b:SuperTabCompletionContexts = [
		\ 'ContextComplete', 's:ContextText'
		\ ]
	let b:SuperTabContextCompleteMemberPatterns = [
		\ 'settings.'
		\ ]
endfunction


function ContextComplete()
	let l:curline = getline('.')
	let l:cnum = col('.')

	" Skp if file type is excluded
	let l:file_type_excludes = exists('g:SuperTabContextTextFileTypeExclusions') ?
		\ g:SuperTabContextTextFileTypeExclusions : []

	if index(l:file_type_excludes, &ft) != -1
		return
	endif

	" Skip if synname is excluded
	let l:synname_excludes = ['String', 'Comment']
	let l:synname = synIDattr(synID(line('.'), l:cnum - 1, 1), 'name')
	if index(l:synname_excludes, l:synname) != -1
		return
	endif

	" Take paterns from buffer settings or fall back to global
	let l:patterns = 
		\ exists('b:SuperTabContextCompleteMemberPatterns')
		\ ? b:SuperTabContextCompleteMemberPatterns 
		\ : g:SuperTabContextCompleteMemberPatterns
	let l:pattern = join(l:patterns, '\|')

	" Use the 'complete' completion type (see :help complete)
	if curline =~ '\(' . l:pattern . '\)\w*\%' . l:cnum . 'c'
		return "\<c-n>"
	endif
endfunction
