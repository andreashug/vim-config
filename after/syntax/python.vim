syn match pythonFunctionCall /\<\w\+(/he=e-1 display
hi def link pythonFunctionCall Function

syn keyword pythonSelf self
hi def link pythonSelf Identifier

syn keyword pythonBuiltinConst	False True None
hi def link pythonBuiltinConst Boolean
