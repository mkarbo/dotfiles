call plug#begin('~/.vim/plugged')

"-----------------------------------------------
"------------ PLUGINS TO BE LOADED -------------
"-----------------------------------------------

Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'gmarik/Vundle.vim'
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-airline/vim-airline'
Plug 'noah/vim256-color'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
call plug#end()

"-----------------------------------------------
"--------------- PLUGIN OPTIONS ----------------
"-----------------------------------------------

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

autocmd VimEnter * NERDTree

map <S-Tab> :NERDTreeToggle<CR>



autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror




autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:gruvbox_termcolors=16

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:airline_theme='base16_bespin'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''



let g:pymode_lint_unmodified = 1
let g:pymode_options_max_line_length= 88
let g:pymode_options_colorcolumn = 0
"add error messages from linting in pymode to below list to ignore them
"let g:pymode_lint_ignore = ['E501', 'W', ]
