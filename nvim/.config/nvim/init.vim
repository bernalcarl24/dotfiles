if empty(glob('~/.local/share/nvim/plugged'))
  silent !curl -fLo ~/.local/share/nvim/plugged --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  
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

" fuzzy search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

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
nnoremap <silent><c-p> :FZF<cr>
nnoremap <silent><c-h> :bp<cr>
nnoremap <silent><c-l> :bn<cr>

""" plugins settings

" lightline
let g:lightline#bufferline#enable_devicons=1

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

" git gutter
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe

hi Search guibg=#343945 guifg=none
hi HiUnderCursor guibg=#3b424f guifg=none
hi QuickFixLine guibg=#3b424f guifg=none
