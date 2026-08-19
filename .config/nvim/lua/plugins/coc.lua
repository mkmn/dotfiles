return {
  "neoclide/coc.nvim",
  branch = "release",
  lazy = false, -- 補完/LSPは起動時から必要なため即時ロード
  init = function()
    -- CocInstall で入れる拡張をここで宣言（別環境でも再現できるように）
    -- ※これまで手動で入れていたコンプ拡張もここに集約する
    vim.g.coc_global_extensions = {
      "coc-eslint", -- 既存のESLintルールをそのまま活かす
      "coc-oxc", -- oxlint / oxfmt (oxc-project公式)
      "coc-prettier", -- フォーマットはprettierに一本化（元ALEのprettier fixerの後継）
      "coc-tsserver", -- TypeScript/JavaScriptの型情報付き補完・定義ジャンプ・リファクタリング
      "coc-solargraph", -- Rubyの言語サーバー。coc-settings.jsonのsolargraph.diagnosticsはこれが必要
    }
  end,
  config = function()
    -- coc-tsserverは自前でフォーマット機能を持つが、今回はprettier/oxfmtに一本化したいため
    -- フォーマット関連の機能だけ無効化する（補完・定義ジャンプ等の言語機能は有効のまま）
    vim.g.coc_user_config = vim.tbl_extend("force", vim.g.coc_user_config or {}, {
      ["typescript.format.enable"] = false,
      ["javascript.format.enable"] = false,
    })
    -- モノレポ対策: JS/TS系ファイルではpackage.json/oxlintrc/oxfmtrcを
    -- .git(親リポジトリ)より優先してワークスペースルートとして検出させる。
    -- coc-eslintやtsserverなど「rootUri」を見て動くLSPには効くが、
    -- coc-oxcのように単純にworkspace.root(=nvimのcwdに基づく単一値)を直接参照する
    -- 実装には効かない。coc-oxcでnode_modules/.bin/{oxlint,oxfmt}を正しく自動検出させるには、
    -- モノレポの各プロジェクトはそのサブディレクトリでnvimを開くこと
    -- (例: cd ~/workspace/yabumi/frontend && nvim .)。詳細はREADME参照。
    vim.cmd([[
      autocmd FileType javascript,javascriptreact,javascript.jsx,typescript,typescriptreact,typescript.tsx
        \ let b:coc_root_patterns = ['.oxlintrc.json', '.oxfmtrc.json', 'package.json', '.git']
    ]])

    -- 元 dein.toml の hook_add をそのまま移植（動作を変えないため vimscript のまま維持）
    vim.cmd([[
      function! CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
      endfunction

      " autocomplete
      inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
      inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
      inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
      inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackSpace() ? "\<Tab>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      inoremap <silent><expr> <c-space> coc#refresh()

      " Use `[c` and `]c` to navigate diagnostics
      nmap <silent> [c <Plug>(coc-diagnostic-prev)
      nmap <silent> ]c <Plug>(coc-diagnostic-next)

      " Remap keys for gotos
      nmap <silent> <space><space> :<C-u>CocList<cr>
      nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
      nmap <silent> df <Plug>(coc-definition)
      nmap <silent> dr <Plug>(coc-references)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
    ]])
  end,
}
