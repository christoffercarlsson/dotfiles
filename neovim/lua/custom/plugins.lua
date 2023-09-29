local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "objc",
        "prisma",
        "rust",
        "sql",
        "ssh_config",
        "swift",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "black",
        "clangd",
        "clang-format",
        "codelldb",
        "cmake-language-server",
        "eslint-lsp",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "rust-analyzer",
        "stylua",
        "typescript-language-server",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      disable_netrw = true,
      filters = {
        custom = { "^\\.git$", "^\\.DS_Store$", "^\\.cache$" },
      },
      renderer = {
        special_files = {},
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
          },
        },
      },
      view = {
        width = {
          min = 36,
        },
      },
    },
  },
  {
    "dstein64/nvim-scrollview",
    event = "VeryLazy",
    config = function()
      require("scrollview").setup {
        excluded_filetypes = { "NvimTree" },
        signs_on_startup = {},
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        color_devicons = false,
        preview = {
          hide_on_startup = true,
        },
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {
      window = {
        backdrop = 1,
        width = 82,
        options = {
          number = false,
          relativenumber = false,
        },
      },
      on_open = function()
        vim.cmd "ScrollViewDisable"
        vim.cmd "Gitsigns toggle_signs"
        local ft = vim.bo.filetype
        if ft == "markdown" or ft == "text" then
          vim.g.cmp_enabled = false
        end
      end,
      on_close = function()
        vim.cmd "ScrollViewEnable"
        vim.cmd "Gitsigns toggle_signs"
        vim.g.cmp_enabled = true
      end,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    opts = {
      enabled = function()
        return vim.g.cmp_enabled
      end,
    },
  },
}
return plugins
