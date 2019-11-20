nnoremap <Space> <NOP>
"next location in locationlist
nnoremap <Space>n :lnext <CR>
"prev location in locationlist
nnoremap <Space>p :lprev <CR>

command Bd bp | sp | bn | bd

nmap <C-Space> <C-^>
nmap gb :ls<CR>:buffer
tnoremap <Esc> <C-\><C-n>

" Cycle buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
" nmap <C-S-c> :Bclose<CR>

nmap <C-Del> :%s/\s\+$//g<CR>


nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

