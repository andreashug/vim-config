augroup vim_lsp_pylsp_setup
	au!
	au User lsp_setup call s:RegisterServer()
augroup END


function s:RegisterServer()
	if lsp#get_allowed_servers('python') != []
		echoerr "Can\'t register pylsp langiage server"
		return
	endif

	call lsp#register_server({
		\ 'name': 'pylsp',
		\ 'cmd': function('s:GetServerCommand'),
		\ 'allowlist': ['python'],
		\ 'config': {
			\'completion_item_kinds': g:lsp_completion_item_kinds,
		\ },
		\ 'workspace_config': {'pylsp': {'plugins': {
			\ 'jedi_completion': {'enabled': v:true, 'resolve_at_most': 0},
			\ 'autopep8': {'enabled': v:false},
			\ 'black': {'enabled': v:false},
			\ 'mccabe': {'enabled': v:false},
			\ 'pycodestyle': {'enabled': v:false},
			\ 'pyflakes': {'enabled': v:false},
			\ 'rope_autoimport': {'enabled': v:false},
			\ 'rope_completion': {'enabled': v:false},
			\ 'ruff': {'enabled': v:false},
			\ 'yapf': {'enabled': v:false},
			\ }}}
		\ })
endfunction


function s:GetServerCommand(server_info)
	let l:command = ['pylsp']
	if !empty(g:lsp_log_file)
		let s:pylsp_log_file = fnamemodify(g:lsp_log_file, ':h') .. '/py-lsp.log'
		call extend(l:command, ['-vv', '--log-file', s:pylsp_log_file])
	endif
	return l:command
endfunction
