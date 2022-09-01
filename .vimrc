set smarttab


set scrolloff=1
set wrap
set laststatus=2
set title

set backupdir=~/.cache/vim

set formatoptions+=j
set clipboard=unnamed
if has('filetype')
	filetype indent plugin on
endif

if has('syntax')
	syntax on
endif

set hidden

set wildmenu

set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start

set autoindent
set nostartofline
set ruler
set laststatus=2

set confirm

if has('mouse')
	set mouse=a
endif

set cmdheight=2

set number
set relativenumber

set shiftwidth=4
set tabstop=4
set noexpandtab
set listchars=tab:>-,trail:-
set incsearch

inoremap <c-B> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-B> <Esc>:Lex<cr>:vertical resize 30<cr>

inoremap qq <Esc>
nnoremap ds :exec '%s/'.getline('.')[col('.')-1].'//'
":#set so=r3"l:ill: line just to test stuff"
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
