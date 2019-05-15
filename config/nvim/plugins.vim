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
"Plug 'w0rp/ale'
"Plug 'powerline/powerline'
"Plug 'ambv/black'

call plug#end()

"-----------------------------------------------
"--------------- PLUGIN OPTIONS ----------------
"-----------------------------------------------

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

autocmd VimEnter * NERDTree

map <C-n> :NERDTreeToggle<CR>



autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror




autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:airline_theme='base16_bespin'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''


" Only lint on exit
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_linters = {'python': ['flake8']}
"
"
"nnoremap <space>l :lnext<CR>
"nnoremap <space>p :lprevious<CR>
"nnoremap <space>r :lrewind<CR>

