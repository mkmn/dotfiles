local M = {}

local prettier_configs = {
  ".prettierrc",
  ".prettierrc.{json,json5,yaml,yml,toml,js,cjs,mjs,ts,cts,mts}",
  "prettier.config.{js,cjs,mjs,ts,cts,mts}",
}
local oxfmt_configs = { ".oxfmtrc.{json,jsonc}", "oxfmt.config.ts" }

local function has_config(dir, patterns)
  for _, pattern in ipairs(patterns) do
    if #vim.fn.globpath(vim.fn.escape(dir, ","), pattern, true, true) > 0 then
      return true
    end
  end
  return false
end

local function package_formatter(dir)
  local path = vim.fs.joinpath(dir, "package.json")
  if not vim.uv.fs_stat(path) then
    return
  end
  local ok, package = pcall(function()
    return vim.json.decode(table.concat(vim.fn.readfile(path), "\n"))
  end)
  if not ok or type(package) ~= "table" then
    return
  end
  if package.prettier ~= nil then
    return "prettier"
  end
  for _, formatter in ipairs({ "prettier", "oxfmt" }) do
    for _, section in ipairs({ "devDependencies", "dependencies", "optionalDependencies" }) do
      if type(package[section]) == "table" and package[section][formatter] ~= nil then
        return formatter
      end
    end
  end
end

function M.select(bufnr)
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local dir = filename ~= "" and vim.fs.dirname(filename) or vim.uv.cwd()
  while dir do
    -- Prefer explicit config to dependencies; Prettier wins ties in one directory.
    if has_config(dir, prettier_configs) then
      return { "prettier" }
    end
    if has_config(dir, oxfmt_configs) then
      return { "oxfmt" }
    end
    local formatter = package_formatter(dir)
    if formatter then
      return { formatter }
    end
    -- Do not inherit formatter preferences from outside the repository.
    if vim.uv.fs_stat(vim.fs.joinpath(dir, ".git")) then
      break
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break
    end
    dir = parent
  end
  -- Keep the formatter stable even when a global oxfmt executable is installed.
  return { "prettier" }
end

return M
