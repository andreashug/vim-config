" Vim syntax file
" Language:		Python
" Maintainer:	Andreas Hug (https://github.com/andreashug)
"
" Additional syntax rules for Python


syn match pythonFunctionCall /\<\w\+(/he=e-1 display
hi def link pythonFunctionCall Function
call g:LunarizedHighlightFG("pythonFunctionCall", g:lunarized_violet)

syn keyword pythonSelf self
hi def link pythonSelf Identifier
call g:LunarizedHighlightFG("pythonSelf", g:lunarized_green)

syn keyword pythonBuiltinConst	False True None
hi def link pythonBuiltinConst Boolean
call g:LunarizedHighlightFG("pythonBuiltinConst", g:lunarized_green)
