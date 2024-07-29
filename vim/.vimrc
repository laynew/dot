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

" Filetype plugins
filetype plugin on
filetype indent on

" Other plugins using vim-plug
call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " Autocomplete
    let g:asyncomplete_auto_popup = 1
    imap <buffer> <C-j> <Plug>(asyncomplete_force_refresh)
    inoremap <buffer> <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <buffer> <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Keybinds
let g:mapleader = " "

nmap <Leader>vce :e ~/.vimrc<CR>
nmap <Leader>vcr :source ~/.vimrc<CR> :echo 'config reloaded'<CR>
nnoremap <C-b> <Esc>:Lex<CR>:vertical resize 30<CR>
inoremap <C-b> <Esc>:Lex<CR>:vertical resize 30<CR>


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
