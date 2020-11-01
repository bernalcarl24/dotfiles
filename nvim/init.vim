"TODO make auto install flexible between neovim and vim
if empty(glob('~/.local/share/nvim/plugged'))
  silent !curl -fLo ~/.local/share/nvim/plugged --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  
" misc
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'preservim/tagbar'

" visual
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasr/molokai'
Plug 'doums/darcula'
Plug 'joshdick/onedark.vim'
Plug 'srcery-colors/srcery-vim'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" custom commands
Plug 'AndrewRadev/linediff.vim' " for diffing in same file :Linediff
Plug 'vim-scripts/a.vim' " alternate between .c .h files using :A

" language support
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold' " better python folding

" linting engine
Plug 'dense-analysis/ale'

" fuzzy search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show git status in gutter
Plug 'airblade/vim-gitgutter'

call plug#end()

""" settings
" let g:loaded_matchparen=1
set number relativenumber
set hidden
set mouse=a
set clipboard+=unnamedplus
set ruler
set updatetime=100 

"FIX this only works in neovim
autocmd CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
			\ escape(expand('<cword>'), '/\'))

" visual
filetype plugin indent on
syntax on
" colorscheme darcula
" colorscheme onedark
" colorscheme molokai
" let g:molokai_original=1
colorscheme srcery
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

" folds
set nofoldenable
set foldlevelstart=20

""" shortcuts
nnoremap <silent><space><space> :noh<cr>
nnoremap <silent><esc> <c-w>p

nnoremap <space>s :update<cr>
nnoremap <silent><c-p> :FZF<cr>
nnoremap <silent><c-h> :bp<cr>
nnoremap <silent><c-l> :bn<cr>

" go to next lint error
nmap <silent>M <Plug>(ale_next_wrap)

" window shortcuts
" nmap <silent><m-1> :NERDTreeToggle<cr>
" nmap <silent><m-2> :TagbarToggle<cr>

""" plugins settings

" python
let g:python_highlight_all = 1

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_leader_key=','

" " nerdtree
" let NERDTreeMinimalUI=1
" let g:NERDTreeGitStatusUseNerdFonts=1 
" let g:NERDTreeWinSize=45
" let NERDTreeIgnore = [
" 			\ 'node_modules',
" 			\ 'dist',
" 			\ 'target',
" 			\ 'build',
" 			\ '__pycache__',
" 			\ ]
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
" 			\ b:NERDTree.isTabTree()) | q | endif

" " tagbar
" let g:tagbar_compact=1
" let g:tagbar_show_balloon=0
" let g:tagbar_sort=0

" lightline
" let g:lightline = { 'colorscheme': 'darculaOriginal' }
" let g:lightline = { 'colorscheme': 'onedark' }
let g:lightline#bufferline#enable_devicons=1

" ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_python_auto_pipenv = 1 " detect pip env without sourcing it
let g:ale_go_golangci_lint_executable = 'golangci-lint'
let g:ale_linters = {
			\ 'cpp': ['clangtidy'],
			\ 'c': ['clangtidy'],
			\ 'python': ['flake8'],
			\ 'sh': ['shellcheck'],
			\ 'javascript': ['tsserver'],
			\ 'typescript': ['tsserver'],
			\ 'json': ['jq'],
			\}
let g:ale_fixers = {
			\ 'go': ['gofmt'],
			\ 'cpp': ['clang-format'],
			\ 'c': ['clang-format'],
			\ 'python': ['autopep8', 'isort'],
			\ 'javascript': ['prettier'],
			\ 'typescript': ['prettier'],
			\ 'html': ['prettier'],
			\ 'css': ['prettier'],
			\ 'scss': ['prettier'],
			\ 'sass': ['prettier'],
			\ 'json': ['jq'],
			\}
nmap == :ALEFix<CR>

" coc

" use tab to cycle completion
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" use enter to confirm completion
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : 
				\ "\<C-g>u\<cr>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif

" use preview window for documentation
nnoremap <silent> K :call <SID>show_documentation()<cr>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" fzf
let g:fzf_nvim_statusline=0

" fzf window
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"TODO make width flexible
function! FloatingFZF()
	" position
	let height = float2nr(30)
	let width = float2nr(70)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = float2nr(5 / 2)
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ 'style': 'minimal'
				\ }

	" border
	let top = "╭" . repeat("─", width - 2) . "╮"
	let mid = "│" . repeat(" ", width - 2) . "│"
	let bot = "╰" . repeat("─", width - 2) . "╯"
	let lines = [top] + repeat([mid], height - 2) + [bot]
	let s:buf = nvim_create_buf(v:false, v:true)
	call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
	call nvim_open_win(s:buf, v:true, opts)
	set winhl=Normal:Floating
	let opts.row += 1
	let opts.height -= 2
	let opts.col += 2
	let opts.width -= 4

	call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
	au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

""" color theme helper groups

" coc
hi! link CocErrorSign ErrorSign
hi! link CocWarningSign WarningSign
hi! link CocInfoSign InfoSign
hi! link CocHintSign InfoSign
hi! link CocErrorFloat Pmenu
hi! link CocWarningFloat Pmenu
hi! link CocInfoFloat Pmenu
hi! link CocHintFloat Pmenu
hi! link CocHighlightText IdentifierUnderCaret
hi! link CocHighlightRead IdentifierUnderCaret
hi! link CocHighlightWrite IdentifierUnderCaretWrite
hi! link CocErrorHighlight CodeError
hi! link CocWarningHighlight CodeWarning
hi! link CocInfoHighlight CodeInfo
hi! link CocHintHighlight CodeHint

" ale
hi! link ALEError Error
hi! link ALEWarning CodeWarning
hi! link ALEInfo CodeInfo
hi! link ALEErrorSign ErrorSign
hi! link ALEWarningSign WarningSign
hi! link ALEInfoSign InfoSign

" git gutter
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
" let g:gitgutter_sign_removed = '▶' " Darcula theme specific

"TODO configure to use theme color instead of hard coded color
hi Search guibg=#343945 guifg=none
hi HiUnderCursor guibg=#3b424f guifg=none
hi QuickFixLine guibg=#3b424f guifg=none
