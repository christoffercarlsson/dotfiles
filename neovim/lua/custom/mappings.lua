local M = {}

M.general = {
  n = {
    ["<C-h"] = {
      "<cmd> TmuxNavigateLeft <CR>",
      "Window left",
    },
    ["<C-l"] = {
      "<cmd> TmuxNavigateRight <CR>",
      "Window right",
    },
    ["<C-j"] = {
      "<cmd> TmuxNavigateDown <CR>",
      "Window down",
    },
    ["<C-k"] = {
      "<cmd> TmuxNavigateUp <CR>",
      "Window up",
    },
    ["<leader>zm"] = {
      "<cmd> ZenMode <CR>",
      "Toggle Zen Mode",
    },
    ["<leader><leader>"] = {
      "<cmd> Telescope live_grep <CR>",
      "Telescope Live Grep",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  },
}

return M
