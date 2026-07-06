syntax on

if &term =~ '256color'
    set t_ut=
endif
set t_Co=256
set encoding=utf-8

"Styles
set background=dark
highlight CursorLine term=none cterm=none ctermbg=234
highlight CursorLineNr term=none cterm=bold ctermbg=195 ctermfg=0

" Basic settings
set hidden
set laststatus=2
set number
set relativenumber
set scrolloff=8
set splitbelow
set splitright
set tags+=~/.local/share/tags
set mouse=a
set autoread

" Vim files
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

" Visual settings
set colorcolumn=100
set cursorline
set list
set listchars=tab:\\u21a6\ ,trail:\\xb7

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Search
set incsearch
set nohlsearch
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
    nnoremap <buffer> gd <plug>(lsp-definition)
    nnoremap <buffer> gs <plug>(lsp-document-symbol-search)
    nnoremap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nnoremap <buffer> gr <plug>(lsp-references)
    nnoremap <buffer> gi <plug>(lsp-implementation)
    nnoremap <buffer> gt <plug>(lsp-type-definition)
    nnoremap <buffer> <leader>rn <plug>(lsp-rename)
    nnoremap <buffer> [g <plug>(lsp-previous-diagnostic)
    nnoremap <buffer> ]g <plug>(lsp-next-diagnostic)
    nnoremap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-D> lsp#scroll(-4)

    " Autocomplete
    let g:asyncomplete_auto_popup = 1
    inoremap <buffer> <C-j> <Plug>(asyncomplete_force_refresh)
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

nnoremap <Leader>vce :e $MYVIMRC<CR>
nnoremap <Leader>vvce :vsplit $MYVIMRC<CR>
nnoremap <Leader>vcr :source $MYVIMRC<CR> :echo 'config reloaded'<CR>
nnoremap <C-b> <Esc>:Lex<CR>:vertical resize 30<CR>
inoremap <C-b> <Esc>:Lex<CR>:vertical resize 30<CR>

" Disable arrow keys
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

" Insert comment
nnoremap <Leader>/ :norm I
vnoremap <Leader>/ :norm I

" Replace word
nnoremap <Leader>rw yiw:%s/"//gcODODOD

" Moving lines
nnoremap <C-j> :move .+1<CR>==
nnoremap <C-k> :move .-2<CR>==
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv

" Global copy/paste with <Leader>pPyYd etc
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
if executable('toclip')
    nnoremap <Leader>y "ayy :call system('toclip',getreg('"a'))<CR>
    vnoremap <Leader>y :w !toclip<CR><CR>
else
    nnoremap <Leader>y "+yy
    vnoremap <Leader>y "+y
endif
nnoremap <Leader>d "+dd
vnoremap <Leader>d "+d

" Buffers
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bd :bdelete<CR>

" Quickfix List
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>.  :cnext<CR>
nnoremap <Leader>,  :cprevious<CR>

" Disable Ex mode
map Q gq
