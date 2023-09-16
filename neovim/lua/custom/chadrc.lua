require("custom.options")

vim.api.nvim_create_autocmd("FileType", {
  once = true,
  callback = function()
    vim.cmd("highlight clear NvimTreeExecFile")
    vim.cmd("highlight link ScrollView St_file_info")
  end
})

local M = {}

M.ui = {
  theme = "catppuccin",
  statusline = {
    theme = "default",
    separator_style = "block",
    overriden_modules = require("custom.configs.statusline-override"),
  },
  tabufline = {
    enabled = false
  }
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
