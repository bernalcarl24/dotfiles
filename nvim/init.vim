call plug#begin('~/.vim/plugged')

" misc
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'

" vim improvements
Plug 'tpope/vim-vinegar'
Plug 'srstevenson/vim-picker'

" visual improvements
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" colorschemes
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
set autowrite
let mapleader = "<nop>"

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
set noshowmode

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

" netrw
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse = 0

""" shortcuts
nnoremap <silent>\ :bd<cr>
nnoremap <silent><space><space> :noh<cr>
nnoremap <silent><c-s> :update<cr>
nnoremap <silent><c-h> :bp<cr>
nnoremap <silent><c-l> :bn<cr>

" fuzzy
nmap <silent><c-p> <Plug>(PickerEdit)
nmap <silent><c-o> <Plug>(PickerBuffer)

""" plugins settings

" markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" fuzzy
let g:picker_custom_find_executable = 'ag'
let g:picker_custom_find_flags = 'ag . --silent -l 
            \ --ignore node_modules 
            \ --ignore .git 
            \ --ignore dist 
            \ --ignore target 
            \ --ignore __pycache__ 
            \ --ignore build 
            \ -g ""'

" lightline
let g:lightline = {
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['gitbranch', 'readonly', 'filename', 'modified'],
            \   ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name'
            \ },
            \ }

""" color theme helper groups

" search highlighting
hi Search guibg=#343945 guifg=none
hi QuickFixLine guibg=#3b424f guifg=none
hi HiUnderCursor guibg=#3b424f guifg=none
hi! MatchParen guifg=none
