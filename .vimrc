" Bootstrap
set nocompatible  " turn off Vi capability
filetype off      " it will not to create a problem for vim-plug

" Starting vim-plug
call plug#begin('~/.vim/plugged/')

" Common Plugins
Plug 'tpope/vim-sensible'      " sane defaults
Plug 'preservim/nerdtree'      " file browswer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'        " fuzzy finder
Plug 'itchyny/lightline.vim'   " statusline

" Desktop only plugins
if !exists('$TERMUX_VERSION')
	Plug 'dense-analysis/ale'    " async lightning
	Plug 'junegunn/vim-peekaboo' " register preview
endif

" Termux only plugins
if exists('$TERMUX_VERSION')
	Plug 'vim-scripts/termux-vim-plugin'
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

" Performance tweak

set ttyfast
set updatetime=300
set shortmess+=I

" Leader key & Mappings
let mapleader = " "
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :Files<CR>          " FZF file finder 
nnoremap <Leader>b :Buffers<CR>

" Desktop-only Overrides
if !exists('$TERMUX_VERSION')
	set swapfile
	set undodir=~/.vim/undodir
	set undofile
	autocmd VimEnter * :set termguicolors
endif

" Termux-only Overrides
if exists('$TERMUX_VERSION')
  set directory=~/.vim/tmp//    " swap files folder
  set ttimeoutlen=50            " faster key-chord detection
  set background=dark           " better contrast on Android
  " map volume keys to scroll
  nnoremap <A-Up>   <C-Y>
  nnoremap <A-Down> <C-E>
endif
