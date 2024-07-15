syntax on

if &term =~ '256color'
    set t_ut=
endif
set t_Co=256
set encoding=utf-8

set background=dark
set nohlsearch
set hidden
set incsearch
set laststatus=2
set list
set listchars=tab:\\u21a6\ ,trail:\\xb7
set number
set relativenumber
set scrolloff=8
set splitbelow
set splitright
set tags+=~/.local/share/tags

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set path+=**
set wildignore=.git/*
set wildmenu

filetype plugin on
filetype indent on

let g:mapleader = " "

nmap <Leader>vce :e ~/.vimrc<CR>
nmap <Leader>vcr :source ~/.vimrc<CR> :echo 'config reloaded'<CR>

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
if executable('toclip')
    nmap <Leader>y "ayy :call system('toclip',getreg('"a'))<CR>
    vmap <Leader>y :w !toclip<CR><CR>
else
    nmap <Leader>y "+yy
    vmap <Leader>y "+y
endif
nmap <Leader>d "+dd
vmap <Leader>d "+d

" Buffers
nmap <Leader>bn :bnext<CR>
nmap <Leader>bd :bdelete<CR>

" Disable Ex mode
map Q gq
