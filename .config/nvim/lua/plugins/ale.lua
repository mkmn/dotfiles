return {
  "dense-analysis/ale",
  ft = { "ruby" }, -- JS/TSのfix/lintはcoc-eslint / coc-oxc / coc-prettierへ移行したため対象を縮小
  init = function()
    vim.g.ale_fixers = {
      ruby = { "rubocop" },
    }
    vim.g.ale_linters = {
      ruby = { "rubocop" },
    }
    vim.g.ale_fix_on_save = 1
    vim.g.ale_lint_on_text_changed = 0
    vim.g.ale_open_list = 0
    vim.g.ale_keep_list_window_open = 1
    vim.g.ale_ruby_rubocop_auto_correct_all = 1
    vim.g.ale_ruby_rubocop_executable = "bundle"
  end,
  config = function()
    vim.keymap.set("n", "<F8>", "<Plug>(ale_fix)")
  end,
}
