return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<space>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<space>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep (ripgrep)" },
    { "<space>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<space>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- .gitignoreされたファイルは検索対象から除外
        file_ignore_patterns = { "node_modules", "%.git/" },
      },
    })
  end,
}
