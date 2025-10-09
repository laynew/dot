" makeprg: Look for build.sh otherwise basic gcc build
if filereadable(getcwd() . '/build.sh')
    setlocal makeprg=sh\ build.sh
else
    setlocal makeprg=gcc\ -o\ %<\ %
endif

" run command execute ./main or run.sh if it exists
function! s:SmartRun()
    if filereadable(getcwd() . '/run.sh')
        execute '!' . 'sh run.sh'
    elseif filereadable(getcwd() . '/main.c')
        execute '!./main'
    else
        execute '!./' . expand('%<')
    endif
endfunction

" compile then run if no errors
function! CompileAndRun()
    write
    make
    copen
    if empty(getqflist({'idx':0}).items)
        call <SID>SmartRun()
    endif
endfunction

command! -buffer Run :make<CR> | call <SID>SmartRun()
command! -buffer CompileAndRun :make<CR> | call <SID>SmartRun()

nnoremap <F6> :w<CR>:make<CR>:copen<CR>
nnoremap <F5> :CompileAndRun<CR>
