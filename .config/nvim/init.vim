let mapleader = ","

" Install vim-plug to ~/.local/share/nvim/site/autoload/plug.vim
" Plugins installed to ~/.local/share/nvim/plugged:
call plug#begin()

Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'

" Color scheme
Plug 'sjl/badwolf'

call plug#end()

"set clipboard+=unnamedplus
set encoding=utf-8
set noswapfile

syntax on
set background=dark
colorscheme badwolf
filetype plugin indent on

set showcmd number nobackup nowritebackup cursorline
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 "smarttab
set wildmenu
set lazyredraw
set showmatch
"set mouse=a
"set textwidth=120
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent " fold based on indent level
set cc=120

nmap <Leader>t :Files<CR>
"nmap <c-p> :GFiles<CR>

nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nt :NERDTreeToggle<CR>

" space open/closes folds
nnoremap <space> za

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
nmap s <Plug>(easymotion-s2)

