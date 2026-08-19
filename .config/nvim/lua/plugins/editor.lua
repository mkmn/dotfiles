return {
  {
    "Shougo/deoplete.nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      -- 元dein.tomlの設定を維持（ただし変数名は neocomplete 時代のもので
      -- deoplete自体には効いていない可能性があります。動作を変えないためそのまま移植。
      -- 実際にdeopleteの挙動を変えたい場合は g:deoplete#enable_at_startup 等が必要です）
      vim.g.acp_enableAtStartuo = 0
      vim.g["neocomplete#enable_at_startup"] = 1
      vim.g["neocomplete#enable_smart_case"] = 1
      vim.g["neocomplete#enable_underbar_completion"] = 1
      vim.g["neocomplete#enable_camel_case_completion"] = 1
      vim.g["neocomplete#auto_completion_start_length"] = 2
      vim.g.neocomplcache_enable_auto_close_preview = 0
    end,
  },
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
