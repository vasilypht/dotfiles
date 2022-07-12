set guicursor="ver"

set encoding=utf-8
set number
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

call plug#end()

syntax on
set termguicolors
colorscheme onedark

set mouse=a

let g:airline_theme="onedark"

hi LineNr guifg=grey
hi Normal ctermbg=NONE guibg=NONE
