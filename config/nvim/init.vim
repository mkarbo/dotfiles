set nu
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/godlygeek/tabular'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'ibhagwan/fzf-lua'
Plug 'HerringtonDarkholme/yats.vim' "
Plug 'jpalardy/vim-slime'
call plug#end()

:set background=dark
:set termguicolors
:colorscheme embark
:redraw!
set noswapfile

"let g:indent_guides_enable_on_vim_startup = 1


"---------------------------------------------------------------------------------
"  CONFIGURE PLUGINS
"---------------------------------------------------------------------------------

" ------------NERDTREE------------
autocmd StdinReadPre * let s:std_in=1
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif


" ------------CoC-------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-pyright'
  \ ]
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

set signcolumn=yes
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> ]p :GitGutterPreviewHunk<CR>
nmap <silent> [p :GitGutterFold<CR>


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"  MAPPINGS
" ---------------------------------------------------------------------------------
command Bd bp | sp | bn | bd

nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

"nmap <S-Tab> :NERDTree<CR><C-w>=


map <leader>t :NERDTreeToggle<CR>

nmap <script> <silent> <Space>c :call ToggleLocationList()<CR>


" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror




" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nmap <C-Space> <C-^>
"nmap gb :ls<CR>:buffer
nmap gb :Buffers<CR>

if has("nvim")
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>

  au! FileType fzf tunmap <buffer> <Esc>
endif


let NERDTreeIgnore=['__pycache__']
let NERDTreeShowHidden=1

" Cycle buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
" nmap <C-S-c> :Bclose<CR>
"

" vmap <leader>s :CocCommand python.execSelectionInTerminal<CR>
" let g:send_disable_mapping=1
" 
" tnoremap <leader>S :SendHere<CR>
" nmap <leader>h <Plug>SendLine
" nmap <leader>s <Plug>Send
" vmap <leader>w <Plug>Send

nmap <C-Del> :%s/\s\+$//g<CR>
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set list

let g:gruvbox_termcolors=16

autocmd TermOpen * set bufhidden=hide


autocmd BufNewFile,BufRead *.re set syntax=reason
autocmd BufNewFile,BufRead *.ts set syntax=typescript
autocmd BufNewFile,BufRead *.tsx set syntax=typescript.tsx
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

map <leader>g :GFiles<CR>
map <leader>b :Buffers<CR>

:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


let g:slime_python_ipython=1
let g:slime_target = "neovim"

if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif


nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"


function! ThirdSplit()
  exec (winheight(0)-winheight(0)/3)."split"
endfunction


nnoremap <expr> <C-w>t ThirdSplit()


nnoremap <Leader>ss :mksession! ~/.config/nvim/sessions/
nnoremap <Leader>os :source ~/.config/nvim/sessions/
nnoremap <Leader>rs :!rm ~/.config/nvim/sessions/

function! CleanUp(...)
  if a:0  " opfunc
    let [first, last] = [line("'["), line("']")]
  else
    let [first, last] = [line("'<"), line("'>")]
  endif
  for lnum in range(first, last)
    let line = getline(lnum)

    " clean up the text, e.g.:
    let line = substitute(line, '\s\+$', '', '')

    call setline(lnum, line)
  endfor
endfunction

nmap <silent> <Leader>x :set opfunc=CleanUp<CR>g@
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
" autocmd CursorHold * silent call CocActionAsync('doHover')
inoremap <C-k> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

let @7="s  hp"
