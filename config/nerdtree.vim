nnoremap <silent> <F11> :NERDTreeFind<CR>
nnoremap <silent> <S-F11> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$', '\~$', '__pycache__', 'egg-info', 'node_modules']
let NERDTreeRespectWildIgnore = 1
let NERDTreeStatusline = 'nerdtree'
let NERDTreeAutoDeleteBuffer = 1


augroup nerdtree_config
	au!
	au BufEnter * call s:OnBufEnter()
	au VimEnter * call s:OnVimEnter()
augroup END

function s:OnBufEnter()
	" Quit if NERDTree is the only remaining window
	if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
		q
	endif
endfunction

function s:OnVimEnter()
	if has('gui_running')
		NERDTree
		wincmd w
	endif
endfunction
