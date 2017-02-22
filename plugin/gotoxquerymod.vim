function! GetXqueryNamespace()
    normal! yiw
    return split(split(@", ":")[0], '\$')[0]
endfunction

function! GetXqueryDeclare()
    normal! yiw
    return split(@", ":")[1]
endfunction

function! GetXqueryModuleAt()
    "execute '/at\s\+"'
    execute "normal! /at\\s\\+\"\<cr>"
    normal! y$
    let eol = split(@", '"')[1]
    return eol
endfunction

function! GotoXqueryModule()
    let namespace = GetXqueryNamespace()
    let declare = GetXqueryDeclare()
    execute '/import\s\+module\s\+namespace\s\+' . namespace . '\s\+'
    let at = GetXqueryModuleAt()
    " if at starts with '/' then add '.' and attempt to open the file
    if filereadable(at)
        echom "if, edit " . at
        execute "edit " . at
        execute "normal! /" . declare . "\<cr>"
    elseif filereadable('.' . at)
        echom "else if, edit ." . at
        execute "edit ." . at
        execute "normal! /" . declare . "\<cr>"
    else
        echom "unable to edit " . at
    endif

    return 0
endfunction
