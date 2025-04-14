let g:ale_fixers = {
    \ 'python': ['ruff', 'ruff_format', 'trim_whitespace', 'remove_trailing_lines']
\ }
let g:ale_linters = {
    \ 'python': ['ruff']
\ }
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_echo_msg_format = '[%linter%] %(code): %%s [%severity%]'
let g:ale_set_balloons = 0
let g:ale_hover_to_floating_preview = 1
let g:ale_floating_window_border = repeat([''], 8)

" Show virtual text next to error
let g:ale_virtualtext_cursor = 'all'

let g:ale_sign_error = '■'
let g:ale_sign_style_error = '□'
let g:ale_sign_warning = '▲'
let g:ale_sign_style_warning = '△'
let g:ale_sign_info = '●'

let g:ale_type_map = {
	\ 'mypy': {"E": "I", "W": "I"},
\ }

"let g:ale_python_pyright_config = {
"  \ 'pyright': {
"  \   'typeCheckingMode': 'off',
"  \ },
"  \}

"let g:ale_python_pylsp_config={'pylsp': {
"  \ 'plugins': {
"  \   'black': {'enabled': v:false},
"  \ },
"  \ }}


let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1

"imap <silent> <F5> <Plug>(ale_complete)
"set omnifunc=ale#completion#OmniFunc
"set completeopt=menu,menuone,popup,noselect,noinsert

nnoremap <silent> <C-b> <Plug>(ale_fix)
