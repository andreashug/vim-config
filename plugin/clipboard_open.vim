function! ClipboardOpen()
    let l:filename = @+
    
    let l:filename = trim(l:filename)
    
    if empty(l:filename)
        echo "Clipboard is empty"
        return
    endif
    
    if filereadable(l:filename)
        execute "edit" fnameescape(l:filename)
    else
        echo "File does not exist: " . l:filename
    endif
endfunction
