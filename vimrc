set number
set relativenumber
set cursorline

" unable syntax
syntax on
" set tab = 4 space
set tabstop=4
set softtabstop=4

set autoindent

" fast pressing j -> esc
imap jj <Esc>

" plugins
call plug#begin()

	Plug 'morhetz/gruvbox'

call plug#end()

" theme
colorscheme gruvbox
set bg=dark
