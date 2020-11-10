call plug#begin('~/.vim/plugged')
  
" misc
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'

" visual
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'w0ng/vim-hybrid'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" language support
Plug 'sheerun/vim-polyglot'

" show git status in gutter
Plug 'airblade/vim-gitgutter'

call plug#end()

""" settings
set number relativenumber
set hidden
set mouse=a
set clipboard+=unnamedplus
set ruler
set updatetime=100 

autocmd CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
			\ escape(expand('<cword>'), '/\'))

" visual
filetype plugin indent on
syntax on
set background=dark
colorscheme hybrid
set cursorline
set termguicolors
set colorcolumn=80
set guicursor= 
set cmdheight=2
set signcolumn=yes

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" default tabs and indent
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

""" shortcuts
nnoremap <silent><space><space> :noh<cr>

nnoremap <silent><c-s> :update<cr>
nnoremap <silent><c-h> :bp<cr>
nnoremap <silent><c-l> :bn<cr>

""" plugins settings

" lightline
let g:lightline#bufferline#enable_devicons=1

""" color theme helper groups

" git gutter
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe

hi Search guibg=#343945 guifg=none
hi HiUnderCursor guibg=#3b424f guifg=none
hi QuickFixLine guibg=#3b424f guifg=none
