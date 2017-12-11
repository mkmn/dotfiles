" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

" line feed
set fileformats=unix,dos,mac

set backspace=indent,eol,start

" no backup files
set nobackup
set noswapfile

" tab
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" display
set cursorline
set number
set showmatch

" status line
set laststatus=2

" color
syntax on

" complement
set pumheight=10

" search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

set exrc
set secure

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let s:dein_cache_path = expand('~/.cache/dein')


" Required:
if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_cache_path . ('/repos/github.com/Shougo/dein.vim'))

  " Add or remove your plugins here:
  call dein#add('scrooloose/nerdtree')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('tpope/vim-endwise')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Townk/vim-autoclose')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('slim-template/vim-slim')
  call dein#add('tpope/vim-rails')
  call dein#add('ngmy/vim-rubocop')
  call dein#add('scrooloose/syntastic')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('szw/vim-tags')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

filetype plugin indent on

" NERDTree
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

" syntastic
let g:syntastic_ruby_checkers = ['rubocop']

" Tags
" let g:vim_tags_auto_genearte = 0
" let g:vim_tags_ctags_binary  = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
