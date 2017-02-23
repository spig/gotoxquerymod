" ---------------------------------------------------------------------------
" Standard ftplugin boilerplate; see ':help ftplugin'.
" ---------------------------------------------------------------------------
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

if !exists('g:gotoxquerymodule_map_keys')
    let g:gotoxquerymodule_map_keys = 1
endif

if g:yourplugin_map_keys
    nnoremap <buffer> <leader>g :call GotoXqueryModule()<CR>
endif
