set clipboard+=unnamedplus

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

" complement
set pumheight=10

" search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

colorscheme vim
set notermguicolors

set exrc
set secure

" format file
nnoremap <Space>f gg=G``

let g:pytho3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog = '~/.anyenv/envs/rbenv/shims/neovim-ruby-host'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let s:dein_cache_path = '~/.cache/dein'
let g:dein#install_github_api_token = $GITHUB_ACCESS_TOKEN

" Required:
if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  " Let dein manage dein
  " load dein config toml:
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

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

if dein#check_update(v:true)
  call dein#update()
endif

"End dein Scripts-------------------------

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
