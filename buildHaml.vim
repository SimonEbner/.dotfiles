function! BuildHaml()
    let a:filename=expand( '%:t' )
    let a:path=expand( '%:p:h' )
    let a:widgetsDir = matchstr( a:path, '.*fa-widgets' )
    if empty( matchstr( a:filename, '\.haml' ))
        echo 'No Haml file'
    elseif empty( a:widgetsDir )
        echo 'No fa-widgets'
    else
        let a:cmd = '!php ' . a:widgetsDir . '/convertHaml.php ' . @%
        echo a:cmd
        let cmd=a:cmd
        :execute a:cmd
    endif
endfunction
:nnoremap <C-b> :call BuildHaml()<CR>:redraw<CR>
:inoremap <C-b> <C-o>:call BuildHaml()<CR><C-o>:redraw<CR>
