return {
  { "tpope/vim-endwise", ft = "ruby" },
  { "slim-template/vim-slim", ft = "slim" },


  {
    "hashivim/vim-terraform",
    ft = "terraform",
    init = function()
      vim.g.terraform_fmt_on_save = 1
    end,
  },
}
