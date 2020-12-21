call plug#begin('~/.vim/plugged')

" misc
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'

" vim improvements
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'

" visual improvements
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

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

" custom commands
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim'

" language support
Plug 'sheerun/vim-polyglot'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

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
nmap R <plug>(coc-rename)

autocmd FileType go nnoremap == :GoFmt<cr>
autocmd FileType go nnoremap R :GoRename<cr>

" coc goto code navigations
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

""" plugins settings

" python
let g:python_highlight_all = 1

" golang
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_play_open_browser = 0
let g:go_fmt_autosave = 0

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

""" coc settings

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-python',
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-sql',
    \]

" use tab for completion
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use enter to confirm autocompletion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use preview window for documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

""" color theme helper groups

" search highlighting
hi Search guibg=#343945 guifg=none
hi QuickFixLine guibg=#3b424f guifg=none
hi HiUnderCursor guibg=#3b424f guifg=none
hi! MatchParen guifg=none
