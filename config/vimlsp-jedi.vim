augroup vim_lsp_jedi_setup
	au!
	au User lsp_setup call s:RegisterServer()
augroup END


function s:RegisterServer()
	if lsp#get_allowed_servers('python') != []
		echoerr "Can\'t register jedi langiage server"
		return
	endif

	call lsp#register_server({
		\ 'name': 'jedi',
		\ 'cmd': function('s:GetServerCommand'),
		\ 'allowlist': ['python'],
		\ 'config': {
			\'completion_item_kinds': g:lsp_completion_item_kinds,
		\ },
		\ 'workspace_config': {}
		\ })

endfunction


function s:GetServerCommand(server_info)
	let l:command = ['jedi-language-server']
	if !empty(g:lsp_log_file)
		let s:pylsp_log_file = fnamemodify(g:lsp_log_file, ':h') .. '/jedi-lsp.log'
		call extend(l:command, ['-v', '--log-file', s:pylsp_log_file])
	endif
	return l:command
endfunction
