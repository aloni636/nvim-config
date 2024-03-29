return {
  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
      -- `enabled = false` not working, so resolving to manually turning it off
      require("auto-save").off()
    end,
    lazy = true,
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup({})
    end,
    lazy = false,
  },
  {
    -- credits: https://github.com/iamcco/markdown-preview.nvim/pull/562
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({ hint_enable = false })
    end,
    event = "User AstroFile",
  },
  --themes
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        dim_inactive = true,
        on_colors = function(colors)
          -- set window border color
          colors.border = "#565f89"
        end,
      })
    end,
    lazy = false,
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      local c = require("vscode.colors")
      require("vscode").setup({
        group_overrides = {
          SpellBad = { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscRed },
          SpellCap = { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscRed },
          SpellRare = { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscRed },
          SpellLocal = { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscRed },
        },
      })
    end,
    lazy = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, config)
      config.window.position = "left"
      return config
    end,
  },
  {
    "echasnovski/mini.map",
    config = function()
      local map = require("mini.map")
      require("mini.map").setup({
        symbols = {
          encode = map.gen_encode_symbols.dot("3x2"),
        },
        integrations = {
          map.gen_integration.diagnostic({
            error = "DiagnosticError",
            warn = "DiagnosticWarn",
            -- info = "DiagnosticInfo",
            -- hint = "DiagnosticHint",
          }),
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
        },
        window = {
          show_integration_count = false,
        },
      })
      -- map.open()
    end,
    event = "User AstroFile",
  },
  {
    "RRethy/vim-illuminate",
    setup = function()
      require("illuminate").configure({})
    end,
    event = "User AstroFile",
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      -- auto insert mode when entering toggleterm terminals
      on_open = function(_) vim.cmd("startinsert") end
    }
  },
  {
    "jbyuki/one-small-step-for-vimkind",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require "dap"
      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = "Attach to running Neovim instance",
        }
      }
      dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
    end,
    event = "User AstroFile",
  },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = {  "ggandor/leap.nvim" },
    opts = {
      prefix = true,
      paste_on_remote_yank = true
    },
    lazy = false,
  }
  -- {
  --   "danymat/neogen",
  --   requires = "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     require("neogen").setup({ snippet_engine = "luasnip" })
  --   end,
  --   lazy = false
  -- },
}
