call plug#begin('~/.vim/plugged')

" misc
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'

" vim improvements
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'
Plug 'ajh17/VimCompletesMe'

" visual
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
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
Plug 'wellle/targets.vim'

" custom commands
Plug 'tpope/vim-fugitive'

" language support
Plug 'sheerun/vim-polyglot'

call plug#end()

""" settings
set number relativenumber
set hidden
set mouse=a
set clipboard+=unnamedplus
set ruler
set updatetime=300 

" visual
filetype plugin indent on
syntax on
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
set wildmenu
set grepprg=ag\ --vimgrep\ $*

" default tabs and indent
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" omni completion
set shortmess+=c

" highlight all occurance of the word under the cursor
autocmd CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
			\ escape(expand('<cword>'), '/\'))

""" shortcuts
nnoremap <silent><space><space> :noh<cr>
nnoremap <silent><c-s> :update<cr>
nnoremap <silent><c-h> :bp<cr>
nnoremap <silent><c-l> :bn<cr>
nnoremap == :FormatCode<cr>

""" plugins settings

" python
let g:python_highlight_all = 1

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

""" color theme helper groups

" git gutter
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe

" search highlighting
hi Search guibg=#343945 guifg=none
hi QuickFixLine guibg=#3b424f guifg=none
hi HiUnderCursor guibg=#3b424f guifg=none
