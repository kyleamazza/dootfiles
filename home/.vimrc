" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" set runtimepath (rtp) to include Vundle, then initialize
call plug#begin('~/.vim/plugged')

" Add all plugins AFTER this line
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-markdown'
Plug 'rkitover/vimpager'
Plug 'tpope/vim-commentary'
Plug 'sheerun/dracula-theme'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/emmet-vim'
Plug 'zhou13/vim-easyescape'
Plug 'mileszs/ack.vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'quramy/tsuquyomi'
Plug 'burner/vim-svelte'
Plug 'valloric/youcompleteme'
Plug 'janko/vim-test'

" MAKE SURE YOU HAVE THIS LINE. OTHERWISE NOTHING WILL WORK BC YOU WERE DUMB
" AND YOU FORGOT THIS LINE. >:|
call plug#end()

" Turn on syntax highlighting
syntax on

" Add plugins BEFORE this line

" For plugins to load correctly
filetype plugin on
filetype plugin indent on

" Pick a leader key
let mapleader = ","

" No swapfile backups
set noswapfile
set nowritebackup
set nobackup

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set nolist
set linebreak
set wrapmargin=0
set textwidth=0
set formatoptions=tqn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set colorcolumn=80

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Move lines (A = Alt)
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Tab navigation
" Note :tabnew <file> opens a new tab
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>
nnoremap te :tabedit<Space>
nnoremap tml :+tabmove<CR>
nnoremap tmh :-tabmove<CR>
nnoremap tc :tabclose<CR>

" Allow hidden buffers
set hidden

" Expand number of registers available for copying
set viminfo='100,<1000,s100,h

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" clear search
map <leader><space> :let @/=''<cr> 

" Remap help key.
inoremap <F2> <ESC>:set invfullscreen<CR>a
nnoremap <F2> :set invfullscreen<CR>
vnoremap <F2> :set invfullscreen<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme darkblue
hi NonText ctermbg=NONE guibg=NONE
hi Normal guibg=NONE ctermbg=NONE

" Force *.md files as Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Force .pro files as Prolog
autocmd BufNewFile,BufReadPost *.pro set filetype=prolog

" Force ts as tsx
autocmd BufNewFile,BufRead,BufReadPost *.ts,*.tsx set filetype=typescript.tsx

" Force .babelrc to be read as json
autocmd BufRead,BufNewFile,BufReadPost .babelrc set filetype=json

" Remap <f1> to open NERDTree
nnoremap <F1> :NERDTreeToggle<CR>

" Set Vim-Airline theme
let g:airline_theme='simple'

" Install dem fancy Powerline fonts from airline-themes
let g:airline_powerline_fonts=1

" YouCompleteMe uses Python2 which is dumb but not really
let g:ycm_server_python_interpreter='python3.7'

" Remove autostart for vim-instant-markdown; Just type the opposite in your
" Vim command line...probably. Or just come back here when you actually need
" to use it.
let g:instant_markdown_autostart = 0

" remap Ctrl + / to Commentary for both Normal and Visual modes (NOTE: for some reason, Vim interprets / as _)
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Use vim-easyescape to help reduce visual pause when remapping ESC
let g:easyescape_chars = { "j": 2 }
let g:easyescape_timeout = 1000
cnoremap jj <ESC>

" Map Shift + F to Ack.vim
nnoremap <S-F> :Ack<space>

" Ctrl Mappings for vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

