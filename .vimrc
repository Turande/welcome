" Bootstrap
set nocompatible  " turn off Vi capability
filetype off      " it will not to create a problem for vim-plug


let g:is_termux = has('unix') && $HOME =~ '/data/data/com.termux'

" Starting vim-plug
call plug#begin('~/.vim/plugged/')

" Common Plugins
Plug 'tpope/vim-sensible'      " sane defaults
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'        " fuzzy finder
Plug 'itchyny/lightline.vim'   " statusline

" Desktop only plugins
if !g:is_termux
	Plug 'dense-analysis/ale'    " async lightning
	Plug 'presevim/nerdtree' " register preview
endif

call plug#end()

" General Settings

syntax on
set encoding=utf-8
set number relativenumber
set mouse=a
set clipboard+=unnamedplus
set hidden
set wrap
set cursorline
set ttyfast
set updatetime=300
set shortmess+=I
let mapleader = " "

nnoremap <Leader>f :Files<CR>          " FZF file finder 
nnoremap <Leader>b :Buffers<CR>

" Desktop-only Overrides
if !g:is_termux
	set termguicolors
	set undodir=~/.vim/undodir
	set undofile
	nnoremap <Leader>n :NERDTreeToggle<CR>
endif

" Termux-only Overrides
if g:is_termux
  set directory=~/.vim/tmp//    " swap files folder
  set ttimeoutlen=50            " faster key-chord detection
  set background=dark           " better contrast on Android
  " map volume keys to scroll
  nnoremap <A-Up>   <C-Y>
  nnoremap <A-Down> <C-E>
endif
