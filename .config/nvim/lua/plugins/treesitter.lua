return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- 2026年4月にmasterは凍結され、mainが正式版になった
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- 旧API(require('nvim-treesitter.configs').setup{...})は廃止されたため、
    -- 新APIのinstall()とvim.treesitter.start()を組み合わせる方式に変更。
    -- 参考: https://github.com/nvim-treesitter/nvim-treesitter (mainブランチREADME)
    local parsers = {
      -- 今回の対象言語
      "ruby",
      "typescript",
      "tsx",
      "javascript",
      "hcl", -- Terraformの構文(.tf)
      "terraform",
      -- 汎用/補助
      "json",
      "jsonc",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "regex",
    }

    require("nvim-treesitter").install(parsers)

    -- パーサーが対応しているfiletype一覧を収集し、そのfiletypeを開いた時に
    -- treesitterによるハイライトを有効化する（旧highlight.enable=trueの代替）
    local filetypes = {}
    for _, parser in ipairs(parsers) do
      for _, ft in ipairs(vim.treesitter.language.get_filetypes(parser)) do
        table.insert(filetypes, ft)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        -- インストール未完了(初回起動直後など)でエラーにならないようpcallで保護
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
