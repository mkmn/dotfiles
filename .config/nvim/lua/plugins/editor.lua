return {
  {
    "scrooloose/nerdtree",
    init = function()
      vim.g.NERDTreeShowHidden = 1
    end,
    config = function()
      vim.cmd([[
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
          \ quit | endif
        autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
          \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
      ]])
    end,
  },
  { "bronson/vim-trailing-whitespace" },
  {
    "nathanaelkane/vim-indent-guides",
    init = function()
      vim.g.indent_guides_enable_on_vim_startup = 1
      vim.g.indent_guides_exclude_filetypes = { "help", "nerdtree" }
    end,
  },
}
