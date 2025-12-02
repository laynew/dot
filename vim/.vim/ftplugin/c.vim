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

" compile and open if errors
function! s:SmartCompile()
    write
    make
    if ! empty(getqflist())
        copen
    else
        cclose
    endif
endfunction

" compile then run if no errors
function! CompileAndRun()
    write
    make
    if empty(getqflist())
        call <SID>SmartRun()
    else
        copen
    endif
endfunction

function! s:ToggleLineComment()
    let l:line = getline('.')

    if l:line =~ '^\s*//'
        echo "comment line"
        normal _dw
    else
        echo "not a comment line"
        normal _I// 
    endif
endfunction

command! -buffer Run :make<CR> | call <SID>SmartRun()
command! -buffer CompileAndRun :make<CR> | call <SID>SmartRun()
command! -buffer Compile call <SID>SmartCompile()
command! -buffer ToggleLineComment call <SID>ToggleLineComment()

nnoremap <buffer> <F6> :Compile<CR>
nnoremap <buffer> <F5> :CompileAndRun<CR>

nmap <buffer> <Leader>jj /^\i\+ [a-zA-z0-9*_]\+(.*)<CR>
nmap <buffer> <Leader>kk ?^\i\+ [a-zA-z0-9*_]\+(.*)<CR>

nnoremap <Leader><M-/> :ToggleLineComment<CR>
nnoremap <Leader><C-/> :ToggleLineComment<CR>
nnoremap <Leader>// :ToggleLineComment<CR>

nmap <Leader>gt :!ctags -f tags *.c<CR>
nmap <Leader>sp :execute 'ptjump ' . expand('<cword>')<CR>
nmap <Leader>hp :pclose<CR>

nmap <Leader>- zfi{
nmap <Leader>= zo

