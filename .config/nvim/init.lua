-- ============================================================
-- General options (元 init.vim のオプション部分をLua化)
-- ============================================================
vim.opt.clipboard:append("unnamedplus")

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.showmatch = true

vim.opt.laststatus = 2
vim.opt.pumheight = 10

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

vim.cmd("colorscheme vim")
vim.opt.termguicolors = false

vim.opt.exrc = true
vim.opt.secure = true

-- format file
vim.keymap.set("n", "<Space>f", "gg=G``")

vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.ruby_host_prog = "~/.anyenv/envs/rbenv/shims/neovim-ruby-host"

-- .tsx / .jsx を typescript.tsx として扱う（元 init.vim 最終行の移植）
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.tsx", "*.jsx" },
	command = "set filetype=typescript.tsx",
})

-- ============================================================
-- lazy.nvim bootstrap
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins" }, -- lua/plugins/*.lua を自動読み込み
	},
	install = {
		colorscheme = { "default" },
		version = "*",
	},
	checker = { -- プラグインの更新チェックを自動化
		enabled = true,
		notify = false,
	},
})
