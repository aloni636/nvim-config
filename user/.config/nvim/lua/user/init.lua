-- AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key

local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "v2.*", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --    ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --    ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --    ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight-night",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --    Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --    Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = false, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      -- :me: UI settings; Look at AstroNvim/lua/core/utils/ui.lua
      spell = true, -- sets vim.opt.spell
      signcolumn = "yes", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      -- :me: Additional set {opt}
      confirm = true,
      cmdheight = 1,
    },
    wo = {
      foldenable = false,
      foldlevel = 99,
      foldmethod = "expr",
      foldexpr = "nvim_treesitter#foldexpr()",
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --    local_vim.opt.relativenumber = true
  --    local_vim.g.mapleader = " "
  --    local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --    local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --    return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████    ██████",
    "██   ██ ██         ██    ██    ██ ██    ██",
    "███████ ███████    ██    ██████   ██    ██",
    "██   ██      ██    ██    ██    ██ ██    ██",
    "██   ██ ███████    ██    ██    ██  ██████",
    " ",
    "     ███   ██ ██     ██ ██ ███    ███",
    "     ████  ██ ██     ██ ██ ████  ████",
    "     ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "     ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "     ██   ████   ████   ██ ██      ██",
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      -- :me: set to true
      lightspeed = true,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --    return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --    require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      sumneko_lua = {
        settings = {
          Lua = {
            runtime = {
              version = "Lua 5.1",
            },
            diagnostics = {
              -- :me: luacheck does a better job...
              enable = true,
              globals = { "vim", "astronvim" },
            },
          },
        },
      },
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --    settings = {
      --      yaml = {
      --        schemas = {
      --          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --          ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --        },
      --      },
      --    },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

      -- :me: my keybidnings:
      ["<leader>tt"] = false,
      ["<leader>tb"] = {
        function() astronvim.toggle_term_cmd "btop --utf-force" end,
        desc = "ToggleTerm btop",
      },
      -- :me: async execute cmd command
      -- ["<leader>gg"] = {
      --   function()
      --     handle = vim.loop.spawn("gitg", { args = {} }, function()
      --       print "Git UI Closed"
      --       handle:close()
      --     end)
      --   end,
      --   desc = "Git UI",
      -- },
      -- :me: check out builtin.pickers and telescope.defaults.cache_picker
      -- for telescoping over search history
      ["<leader>ss"] = { require("telescope.builtin").resume, desc = "Resume search" },
      -- :me: search for all man pages, not just (1)
      ["<leader>sm"] = {
        function() require("telescope.builtin").man_pages { sections = { "ALL" } } end,
        desc = "Search man pages",
      },
      ["<leader>so"] = { require("telescope.builtin").vim_options, desc = "Search vim options" },
      ["<leader>sp"] = { require("telescope.builtin").builtin, desc = "Search pickers" },
      -- :me: spell suggest
      ["<leader>."] = {
        function() require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor {}) end,
        desc = "Spelling",
      },
      -- ["<Tab>"] = { "<cmd>b#<cr>" },
      -- :me: tab buffer switcher
      ["<Tab>"] = {
        function()
          require("telescope.builtin").buffers {
            sort_lastused = true,
            ignore_current_buffer = true,
            cache_picker = false,
          }
        end,
      },
      ["<leader>bs"] = { function () require("telescope.builtin").current_buffer_fuzzy_find { cache_picker = false } end, desc = "Search buffer" },
      -- :me: ui pannel customize!
      ["<leader>uw"] = {
        function()
          vim.wo.wrap = not vim.wo.wrap
          if vim.wo.wrap then
            vim.cmd "set wrap linebreak nolist"
          else
            vim.cmd "set nowrap nolinebreak list"
          end
          local bool2str = function(bool) return bool and "on" or "off" end
          astronvim.notify(string.format("wrap %s", bool2str(vim.wo.wrap)))
        end,
        desc = "Toggle wrap",
      },
      ["<leader>uI"] = {"<cmd>IndentBlanklineToggle<cr>", desc = "Toggle indent lines"},
      -- ["<leader>ud"] = {
      --   function()
      --
      --   "<cmd>lua vim.diagnostic.config ( {virtual_text = (not vim.diagnostic.config().virtual_text)})<cr>"
      --     local bool2str = function(bool) return bool and "on" or "off" end
      --     astronvim.notify(string.format("wrap %s", bool2str(vim.wo.wrap)))
      --   end,
      --   desc = "Toggle diagnostics",
      -- },

      ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      -- :me: exit terminal inset mode with ctrl-\\, again to toggle terminal
      ["<C-\\>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
      -- ["jj"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    -- :me: proper send to terminal keybind
    v = {
      -- :me: mode adaptive command *string* picking
      ["<leader>e"] = {
        function()
          return vim.api.nvim_get_mode().mode == "V" and "<esc><cmd>'<,'>ToggleTermSendVisualLines<cr>"
              or "<esc><cmd>'<,'>ToggleTermSendVisualSelection<cr>"
        end,
        expr = true,
        desc = "Execute in terminal",
      },
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- { "andweeb/presence.nvim" },
      -- {
      --    "ray-x/lsp_signature.nvim",
      --    event = "BufRead",
      --    config = function()
      --      require("lsp_signature").setup()
      --    end,
      -- },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --    event = "BufRead",
      --    config = function()
      --      require("lsp_signature").setup()
      --    end,
      -- },
      --
      -- :me: smoothhhhhh scrolling!
      ["declancm/cinnamon.nvim"] = {
        config = function()
          require("cinnamon").setup {
            -- KEYMAPS:
            default_keymaps = true, -- Create default keymaps.
            extra_keymaps = true, -- Create extra keymaps.
            extended_keymaps = true, -- Create extended keymaps.
            override_keymaps = true, -- The plugin keymaps will override any existing keymaps.

            -- OPTIONS:
            always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
            centered = true, -- Keep cursor centered in window when using window scrolling.
            default_delay = 3, -- The default delay (in ms) between each line when scrolling.
            hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
            horizontal_scroll = false, -- Enable smooth horizontal scrolling when view shifts left or right.
            max_length = 50, -- Maximum length (in ms) of a command. The line delay will be
            -- re-calculated. Setting to -1 will disable this option.
            scroll_limit = -1, -- Max number of lines moved before scrolling is skipped. Setting
            -- to -1 will disable this option.
          }
        end,
      },
      -- :me: additional plugins
      ["danymat/neogen"] = {
        requires = "nvim-treesitter/nvim-treesitter",
        config = function() require("neogen").setup { snippet_engine = "luasnip" } end,
      },
      -- :me: The great leap yet again!
      ["ggandor/leap.nvim"] = {
        config = function() require("leap").add_default_mappings() end,
      },
      ["ggandor/leap-spooky.nvim"] = { config = function()
        require("leap-spooky").setup {
          affixes = {
            -- These will generate mappings for all native text objects, like:
            -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
            -- Special line objects will also be added, by repeating the affixes.
            -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
            -- window.
            -- You can also use 'rest' & 'move' as mnemonics.
            remote = { window = "r", cross_window = "R" },
            magnetic = { window = "m", cross_window = "M" },
          },

          -- at the cursor position if the unnamed register is in use.
          paste_on_remote_yank = false,
        }
      end },
      ["smjonas/live-command.nvim"] = {
        config = function()
          require("live-command").setup {
            commands = {
              Norm = { cmd = "norm" },
              G = {
                cmd = "g",
              },
              V = {
                cmd = "v",
              },
            },
            defaults = {
              enable_highlighting = true,
              -- :me: inline highlighting cause weird behavior, setting it to false until
              -- https://github.com/smjonas/live-command.nvim/issues/23
              inline_highlighting = false,
              hl_groups = {
                insertion = "DiffAdd",
                deletion = "DiffDelete",
                -- deletion = false,
                change = "DiffChange",
              },
            },
          }
        end,
      },
      -- :me: flit for life!
      ["ggandor/flit.nvim"] = { config = function() require("flit").setup {} end },
      -- ["kevinhwang91/nvim-ufo"] = {
      --   requires = "kevinhwang91/promise-async",
      --   config = function()
      --     require("ufo").setup {
      --       provider_selector = function(bufnr, filetype, buftype) return { "treesitter", "indent" } end,
      --     }
      --   end,
      -- },
      -- :me: colorschemes
      ["folke/tokyonight.nvim"] = {
        config = function()
          require("tokyonight").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
              -- Style to be applied to different syntax groups
              -- Value is any valid attr-list value for `:help nvim_set_hl`
              comments = { italic = true },
              keywords = { italic = true },
              functions = {},
              variables = {},
              -- Background styles. Can be "dark", "transparent" or "normal"
              sidebars = "dark", -- style for sidebars, see below
              floats = "dark", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            on_highlights = function(highlights, colors) end,
          }
        end,
      },
    },
    -- ["better_escape"] = {
    --   mapping = { "jj" },
    --   -- :me: adapt jj to terminal escape codes, else assume insert mode and send normal <esc>
    --   keys = function()
    --     local mode = vim.api.nvim_get_mode().mode
    --     print(mode)
    --     return mode == "t" and "<C-\\><C-n>" or "<esc>"
    --   end,
    -- },
    -- :me: neo-tree default to float
    ["neo-tree"] = {
      window = {
        position = "float",
        mappings = {
          -- ["<esc>"] = "close_window",
          -- ["q"] = "revert_preview",
        },
      },
    },
    -- :me: added few more hotkeys to telescope
    ["telescope"] = {
      defaults = {
        mappings = {
          i = {
            ["<C-Up>"] = require("telescope.actions").results_scrolling_up,
            ["<C-Down>"] = require("telescope.actions").results_scrolling_down,
            ["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
            ["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-g>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
          },
          n = {
            ["<C-Up>"] = require("telescope.actions").results_scrolling_up,
            ["<C-Down>"] = require("telescope.actions").results_scrolling_down,
            ["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
            ["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-g>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
          },
        },
        layout_strategy = "horizontal",
        layout_config = { vertical = { preview_cutoff = 0, mirror = true }, prompt_position = "top" },
        cycle_layout_list = { "vertical", "horizontal" },
      },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      local null_ls = require "null-ls"
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
        -- :me: lua null-ls config:
        null_ls.builtins.formatting.stylua,
        -- :me: Intelegent selene config:
        -- null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.selene.with {
          -- Check if :pwd contains selene.toml file
          -- If not, fallback to default config file found in ~/.config/nvim/lua/user/linter-configs/
          cwd = function(_params)
            local session_cwd = vim.fn.getcwd()
            if vim.fn.filereadable(session_cwd .. "/selene.toml") == 1 then
              return vim.fn.expand(session_cwd)
            else
              return vim.fn.expand "~/.config/nvim/lua/user/linter-configs/" -- fallback value
            end
          end,
        },
      }
      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = { "lua", "python",  "markdown", "help", "bash"},
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- :me: leap configs
    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    -- :me: update fold when entering buffer
    vim.api.nvim_create_autocmd({ "BufEnter" }, { command = "norm zx", desc = "Restart treesitter folding" })

    -- vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" },
    --   { pattern = { "term://*", }, command = "startinsert", desc = "Terminal auto insert" })

    vim.api.nvim_create_autocmd({"TermOpen" ,"BufWinEnter"}, {
      pattern = {"term://*"},
      command = "normal! i",
    })

    -- vim.api.cmd "filetype indent off"
    -- vim.cmd "autocmd BufReadPost,FileReadPost * normal zR"
    -- :me: Additional vimscript cmds:
    -- https://vim.works/2019/03/16/wrapping-text-in-vim/
    -- Set up custom filetypes
    -- vim.filetype.add {
    --    extension = {
    --      foo = "fooscript",
    --    },
    --    filename = {
    --      ["Foofile"] = "fooscript",
    --    },
    --    pattern = {
    --      ["~/%.config/foo/.*"] = "fooscript",
    --    },
    -- }
  end,
}

return config
