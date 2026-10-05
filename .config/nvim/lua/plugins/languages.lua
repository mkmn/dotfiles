local project_formatter = require("util.project_formatter").select

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = project_formatter,
        javascript = project_formatter,
        javascriptreact = project_formatter,
        json = project_formatter,
        markdown = project_formatter,
        typescript = project_formatter,
        typescriptreact = project_formatter,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescript = { "oxlint" },
        typescriptreact = { "oxlint" },
      },
    },
  },
}
