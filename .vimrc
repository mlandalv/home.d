" http://dougblack.io/words/a-good-vimrc.html
" https://statico.github.io/vim3.html

let mapleader = ","

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'jceb/vim-orgmode'

" Language
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'

" Completion
"Plug 'valloric/youcompleteme'
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" Color scheme
Plug 'sjl/badwolf'

call plug#end()

set encoding=utf-8
set noswapfile

syntax on
set background=dark
colorscheme badwolf
filetype plugin indent on

set showcmd number nobackup nowritebackup cursorline
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set wildmenu
set lazyredraw
set showmatch
set mouse=a
set textwidth=120
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent " fold based on indent level

nnoremap <Leader>fd gg=G<CR>
nmap <c-r> :bufdo e<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
" nmap <c-p> :Files<CR>
nmap <c-p> :GFiles<CR>
nmap <Esc>[1;3A :m-2<CR>
nmap <Esc>[1;3B :m+<CR>
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nt :NERDTreeToggle<CR>

" space open/closes folds
nnoremap <space> za

" Easymotion
let g:EasyMotion_smartcase = 1 " Case-insensitive
nmap s <Plug>(easymotion-s)

" vim-jsx
let g:jsx_ext_required = 0

" python
au FileType py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" Git
autocmd FileType gitcommit setlocal textwidth=100

