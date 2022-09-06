if has('filetype')
	filetype indent plugin on
endif

if has('syntax')
	syntax on
endif

set hidden
set clipboard+=unnamed+
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

inoremap qq <Esc>
nnoremap ds :exec '%s/'.getline('.')[col('.')-1].'//'
"this is fine"
vnoremap <c-C> :w !xclip -i -selection clipboard<cr><cr>
"this is not fine but it works"
nnoremap <c-C> pV :w !xclip -i -selection clipboard<cr><cr> dd
":#set so=r3"lill"
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
