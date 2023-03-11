set mouse=a  " enable mouse
set encoding=utf-8
set number
set relativenumber
set noswapfile
set scrolloff=7
set colorcolumn=76

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

inoremap jj <esc>


call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'tanvirtin/monokai.nvim'
Plug 'dylanaraps/wal.vim'

" Discord Rich presence
Plug 'andweeb/presence.nvim'

call plug#end()

set notermguicolors
colorscheme wal

syntax on

" colorscheme monokai
" :lua require('monokai').setup { italics = false }

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
