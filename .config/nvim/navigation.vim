map <Space> <Leader>

" easier switch between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" conflicts with selection
"map <C-s> <C-w>s
"map <C-v> <C-w>v

" terminal escape
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" have %% expand current file directory
" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" shortcut for editing files in same directory as current file
map <leader>ew :edit %%
map <leader>es :split %%
map <leader>ev :vsplit %%
map <leader>et :tabedit %%

"nnoremap H   gT
"nnoremap L   gt
"nnoremap tq  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

" https://sidneyliebrand.medium.com/a-collection-of-vim-key-binds-4d227c9a455
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>
