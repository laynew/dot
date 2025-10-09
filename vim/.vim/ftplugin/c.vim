setlocal makeprg=gcc\ -o\ %<\ %
command! Run :make | :!.%<

nnoremap <C-B> :w<CR>:make<CR>:copen<CR>
nnoremap <F5> :Run
