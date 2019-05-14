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
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-airline/vim-airline'
Plug 'noah/vim256-color'
"Plug 'powerline/powerline'
"Plug 'ambv/black'

call plug#end()

"-----------------------------------------------
"--------------- PLUGIN OPTIONS ----------------
"-----------------------------------------------

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:airline_theme='base16_bespin'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''


