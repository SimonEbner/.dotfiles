function! Build()
    let l:curPath = fnamemodify( resolve( expand ( '%:p' )), ':h' )
    let l:files = [ 'build.py', 'build.bash', 'build.php' ]
    while l:curPath != '/'
        for file in files
            let l:absPath = l:curPath . '/' . file
            if filereadable( l:absPath )
                let l:output = system( l:absPath . ' "' . expand( '%:p' ). '"' )
                let l:output = substitute( l:output, '\n', '', '' )
                "echo 'Executed build-script ' . l:absPath . ': ' . l:output
                return
            endif
        endfor
        let curPath = fnamemodify( curPath, ':h' )
    endwhile
endfunction
:nnoremap <C-b> :call Build()<CR>
:inoremap <C-b> <C-o>:call Build()<CR>
