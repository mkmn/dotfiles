return {
  { "tpope/vim-endwise", ft = "ruby" },
  { "slim-template/vim-slim", ft = "slim" }, -- 元dein.tomlでは常時ロードだったがft遅延化

  { "pangloss/vim-javascript", ft = { "javascript", "javascript.jsx" } },
  { "maxmellon/vim-jsx-pretty", ft = { "javascript", "javascript.jsx" } },
  { "leafgarland/typescript-vim", ft = { "typescript", "typescript.tsx" } },

  -- 元dein_lazy.tomlでは [[plugin]] とタイプミスされており、
  -- dein側で認識されず実質未読み込みだったプラグイン。ここで修正。
  { "peitalin/vim-jsx-typescript", ft = { "typescript", "typescript.tsx" } },

  { "cespare/vim-toml", ft = "toml" },
  {
    "hashivim/vim-terraform",
    ft = "terraform",
    init = function()
      vim.g.terraform_fmt_on_save = 1
    end,
  },
}
