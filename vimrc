" ============================================
"  VIM CONFIG FOR COMPETITIVE PROGRAMMING
" ============================================

" --- basics ---
set nocompatible
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cursorline
set showcmd
set wildmenu
set incsearch
set hlsearch
set nowrap
set scrolloff=8
set signcolumn=yes
set updatetime=100
syntax on
filetype plugin indent on

" --- clipboard ---
set clipboard=unnamedplus

" --- plugins ---
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

call plug#end()

" --- theme ---
colorscheme gruvbox
set background=dark
" fix transparency after colorscheme loads
augroup transparent
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
augroup END

" --- airline ---
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" --- keymaps ---
let mapleader = " "

" compile and run C++
nnoremap <F9> :w <CR>:!g++ -o %:r % -std=c++17 && ./%:r<CR>

" compile only
nnoremap <F8> :w <CR>:!g++ -o %:r % -std=c++17<CR>

" run only
nnoremap <F10> :!./%:r<CR>

" open/close nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" clear search highlight
nnoremap <leader>h :noh<CR>

" save
nnoremap <leader>w :w<CR>

" quit
nnoremap <leader>q :q<CR>

" ============================================
"  AUTO TEMPLATE FOR C++
" ============================================
autocmd BufNewFile *.cpp 0r ~/.vim/templates/cp.cpp


" force transparency - must be at very end
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE
