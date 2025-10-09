command! Run :make | :!.%<

nnoremap <C-B> :w<CR>:make<CR>:copen<CR>
nnoremap <F5> :Run

" makeprg: Look for build.sh otherwise basic gcc build
if filereadable(getcwd() . '/build.sh')
    setlocal makeprg=sh\ build.sh
else
    setlocal makeprg=gcc\ -o\ %<\ %
endif
