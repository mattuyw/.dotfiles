let g:neovide_cursor_animation_length=0
set guifont=Hack\ Nerd\ Font

let g:do_filetype_lua = 1

scriptencoding utf-8
set encoding=utf-8

syntax enable
set mouse=a

set splitright
set splitbelow

set scrolloff=5
set nowrap

" paste from clipboard
" https://medium.com/swlh/8-vim-tricks-that-will-take-you-from-beginner-to-expert-817ff4870245
set clipboard=unnamed
set clipboard+=unnamedplus

" show line numbers
set number relativenumber
" highlight current line
set cursorline
" show right margin at 120 chars
set colorcolumn=120
" autocmd FileType markdown setlocal colorcolumn=80

" show hidden chars
set list
" specify how hidden chars are represented
" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬
" show all characters
set conceallevel=0

" spell check words
autocmd FileType markdown set spell

" allow to cycle from hidden buffers - with unsaved changes
" http://vimcasts.org/episodes/working-with-buffers/
set hidden

" enable file type detection
filetype on

colorscheme vscode
