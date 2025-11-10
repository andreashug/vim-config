syn match pythonFunctionCall /\<\w\+(/he=e-1 display
hi def link pythonFunctionCall Function

if !hlexists('pythonClassVar')
	" Backward compatibility
	syn keyword pythonClassVar self cls
    hi def link pythonClassVar Identifier
endif

syn keyword pythonBuiltinConst	False True None
hi def link pythonBuiltinConst Boolean
