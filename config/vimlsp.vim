

" We use ALE for diagnostics
let g:lsp_diagnostics_enabled = 0
" Show signature help in floating window
let g:lsp_preview_float = 1
let g:lsp_async_completion = 1
let g:lsp_completion_documentation_delay = 500
" Don't highlight reference to word under cursor
let g:lsp_document_highlight_enabled = 0  
let g:lsp_inlay_hints_enabled = 1
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_hover_ui = 'float'
let g:lsp_show_message_log_level = 'log'
let g:lsp_fold_enabled = 0


augroup vim_lsp_setup
	au!
	au User lsp_setup call lsp#register_server({
		\ 'name': 'jedi',
		\ 'cmd': {server_info->['jedi-language-server']},
		\ 'allowlist': ['python'],
		\ 'config': {
			\'completion_item_kinds': {
				\ '3': '𝑓',
			\ }
		\ },
		\ 'workspace_config': {}
	\ })
augroup END


augroup vim_lsp_config
	au!
	au User lsp_buffer_enabled call s:SetLspBufferOptions()
	au User lsp_float_opened call s:SetLspFloatOptions()
augroup END


function s:SetLspBufferOptions() abort
	setlocal completefunc=lsp#complete
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nnoremap <buffer> <F2> <plug>(lsp-hover)
	nnoremap <buffer> <F3> <plug>(lsp-references)
	nnoremap <buffer> <F4> <plug>(lsp-definition)
	nnoremap <buffer> <F5> <plug>(lsp-code-action)
	nnoremap <buffer> gs <plug>(lsp-document-symbol-search)
	nnoremap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nnoremap <buffer> gi <plug>(lsp-implementation)
	nnoremap <buffer> gt <plug>(lsp-type-definition)
	nnoremap <buffer> <leader>rn <plug>(lsp-rename)
	nnoremap <buffer> [g <plug>(lsp-previous-diagnostic)
	nnoremap <buffer> ]g <plug>(lsp-next-diagnostic)

endfunction


function s:SetLspFloatOptions()
	let l:highlight_group = 'Normal'
	let l:borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

	if lsp#document_hover_preview_winid()
		" ID of hover preview (lsp-hover)
		let l:winid = lsp#document_hover_preview_winid()
	elseif lsp#ui#vim#output#getpreviewwinid()
		" ID of signature preview (when typing)
		let l:winid = lsp#ui#vim#output#getpreviewwinid()
	else
		return
	endif
	
	call setwinvar(l:winid, '&wincolor', l:highlight_group)
	call popup_setoptions(l:winid, {'borderchars': l:borderchars})
endfunction


function g:SetLspLog(active)
	if a:active == v:true
		let g:lsp_log_file = g:vim_log_dir .. 'vim-lsp.log'
		let g:lsp_log_verbose = 1
	else
		let g:lsp_log_file = ''
		let g:lsp_log_verbose = 0
	endif
endfunction
