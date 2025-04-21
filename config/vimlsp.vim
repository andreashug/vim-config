" Performance (requires lua and patch-8.2.0775)
let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 0
let g:lsp_format_sync_timeout = 1000

" Use ALE for diagnostics
let g:lsp_diagnostics_enabled = 0

" Show help in floating window
let g:lsp_preview_float = 1
let g:lsp_hover_ui = 'float'

" Show documentation for complete item
let g:lsp_completion_documentation_enabled = 1
let g:lsp_completion_documentation_delay = 500

let g:lsp_async_completion = 1

" Don't highlight reference to word under cursor
let g:lsp_document_highlight_enabled = 0  

" Don't show code actions in signs column
let g:lsp_document_code_action_signs_enabled = 0

" Show hints as virual text
let g:lsp_inlay_hints_enabled = 1

" Show signature help in float
let g:lsp_signature_help_enabled = 1
let g:lsp_signature_help_delay = 500

" Log level in :messages
let g:lsp_show_message_log_level = 'warning'

" Disable folding
let g:lsp_fold_enabled = 0


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
endfunction


function s:SetLspFloatOptions()
	let l:highlight_group = 'Normal'
	let l:borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

	if lsp#document_hover_preview_winid()
		" ID of hover preview (lsp-hover)
		let l:winid = lsp#document_hover_preview_winid()
	elseif lsp#ui#vim#output#getpreviewwinid()
		" ID of signature help preview (when typing)
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
		let g:lsp_show_message_log_level = 'info'
	else
		let g:lsp_log_file = ''
		let g:lsp_log_verbose = 0
		let g:lsp_show_message_log_level = 'warning'
	endif
endfunction

" See vim-lsp/autoload/lsp/omni.vim
let g:lsp_completion_item_kinds =  {
	\ '1': 'text',
	\ '2': 'method',
	\ '3': 'func',
	\ '4': 'constructor',
	\ '5': 'field',
	\ '6': 'var',
	\ '7': 'class',
	\ '8': 'interface',
	\ '9': 'module',
	\ '10': 'prop',
	\ '11': 'unit',
	\ '12': 'value',
	\ '13': 'enum',
	\ '14': 'keyword',
	\ '15': 'snippet',
	\ '16': 'color',
	\ '17': 'file',
	\ '18': 'reference',
	\ '19': 'folder',
	\ '20': 'enum member',
	\ '21': 'constant',
	\ '22': 'struct',
	\ '23': 'event',
	\ '24': 'operator',
	\ '25': 'type parameter',
	\ }
