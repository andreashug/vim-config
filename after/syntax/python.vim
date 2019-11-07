" Vim syntax file
" Language:		Python
" Maintainer:	Andreas Hug (https://github.com/andreashug)
"
" Additional syntax rules for Python


syn match pythonFunctionCall /\<\w\+(/he=e-1 display
hi def link pythonFunctionCall Function

syn keyword pythonSelf self
hi def link pythonSelf Identifier

syn keyword pythonBuiltinConst	False True None
hi def link pythonBuiltinConst Boolean
