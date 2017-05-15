set nocompatible

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

if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-rails'
"NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'szw/vim-tags'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Townk/vim-autoclose'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" NERDTree
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

" syntastic
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" Tags
let vim_tags_ctags_binary           = '/usr/local/bin/ctags'
let g:vim_tags_project_tags_command = "{CTAGS} -f tags -R --exclude=*.js --exclude=*.html . 2>/dev/null"
let g:vim_Tags_gems_tags_command = "{CTAGS} -f .Gemfile.lock.tags -R --exclude=*.js --exclude=*.html `bundle show --paths` 2>/dev/null"

set tags+=tags
nnoremap <C-]> g<C-]>

nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

" neocomplete
"" Disable AutoComplPop.
let g:acp_enableAtStartuo = 0
"" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
let g:neocomplete#enable_smart_case = 1
"" _(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
"" 補完を表示する最小文字数
let g:neocomplete#auto_completion_start_length = 2
"" preview window を閉じない
let g:neocomplcache_enable_auto_close_preview = 0
