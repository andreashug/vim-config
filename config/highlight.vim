" Additional highlighting rules


" Reload this file on colorscheme changes because colorschemes reset all
" highlights.
augroup extend_colorscheme
	autocmd!
	autocmd Colorscheme * runtime config/highlight.vim
augroup END


" Links
hi! link ExtraWhiteSpace SpellBad
hi! link SpelunkerSpellBad SpellBad
hi! link SpelunkerComplexOrCompoundWord SpellLocal


if !exists('g:lunarized_loaded')
	echom 'Skipping extra highlight rules because lunarized is not loaded'
	finish
endif

" Python
hi pythonClassVar guifg=lunarized_green guibg=NONE gui=NONE cterm=NONE
hi pythonClass guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi pythonFunctionCall guifg=lunarized_purple guibg=NONE gui=NONE cterm=NONE

" Leader F
hi Lf_hl_match guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_match0 guifg=lunarized_blue guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_match1 guifg=lunarized_green guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_match2 guifg=lunarized_cyan guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_match3 guifg=lunarized_purple guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_match4 guifg=lunarized_yellow guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_cursorline guifg=lunarized_fg_s guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_tagFile guifg=lunarized_fg_fe guibg=NONE gui=NONE cterm=NONE
hi Lf_hl_rgHighlight guifg=lunarized_yellow guibg=NONE gui=NONE cterm=NONE
