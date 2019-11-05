filetype plugin indent on
set nu
set splitbelow
set splitright

"-----------------------------------------------
"---------------- PYTHON OPTIONS ---------------
"-----------------------------------------------
au BufNewFile,BufRead *.py
 \ set tabstop=8 |
 \ set softtabstop=0 |
 \ set shiftwidth=2 |
 \ set textwidth=79 |
 \ set expandtab |
 \ set autoindent |
 \ set list |
 \ set smarttab
 \ set formatoptions=croql |
 \ set fileformat=unix

set encoding=utf-8
set showcmd
set clipboard=unnamed
set scrolloff=20
set laststatus=2
set noshowmode
let python_highlight_all=1

syntax on



:set noswapfile
