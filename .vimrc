if &term =~ '256color'
    set t_ut=
endif
set t_Co=256
set encoding=utf-8

set background=dark
set nohlsearch
set incsearch
set number
set relativenumber
set scrolloff=8
set tags+=~/.local/share/tags

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set path+=**
set wildmenu

let g:mapleader = " "

nmap <Leader>vce :e ~/.vimrc<CR>
nmap <Leader>vcr :source ~/.vimrc<CR>

" disable arrow keys
noremap <up> :echoerr "use k instead"<CR>
noremap <down> :echoerr "use j instead"<CR>
noremap <left> :echoerr "use h instead"<CR>
noremap <right> :echoerr "use l instead"<CR>

" Center afer scrolling
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Reselect visual selecion after un/indent
vnoremap > >gv
vnoremap < <gv

" Global copy/paste with <Leader>pPyYd etc
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>y "+yy
vmap <Leader>y "+y
nmap <Leader>d "+dd
vmap <Leader>d "+d

" Disable Ex mode
map Q gq
