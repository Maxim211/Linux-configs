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
Plug 'altercation/vim-colors-solarized'
Plug 'dylanaraps/wal.vim'

" Discord Rich presence
Plug 'andweeb/presence.nvim'

call plug#end()

set notermguicolors
colorscheme wal
syntax on

" set background=dark
" set termguicolors
" colorscheme solarized

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
