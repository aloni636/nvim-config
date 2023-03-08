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
      relativenumber = true, -- sets vim.opt.relativenumber
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
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
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
        -- ["<leader>lk"] = { function() vim.lsp.buf.hover() end, desc = "Hover help" },
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
      pyright = { settings = { python = { analysis = { autoImportCompletions = false } } } },
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

      ["<leader>q"] = { "<cmd>wall | quitall<cr>", desc = "Save & quit" },
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
      ["<leader>bs"] = {
        function() require("telescope.builtin").current_buffer_fuzzy_find { cache_picker = false } end,
        desc = "Search buffer",
      },
      -- :me: ui pannel customize!
      ["<leader>uw"] = {
        function()
          vim.wo.wrap = not vim.wo.wrap
          if vim.wo.wrap then
            vim.cmd "set wrap linebreak nolist bri"
          else
            vim.cmd "set nowrap nolinebreak list nobri"
          end
          local bool2str = function(bool) return bool and "on" or "off" end
          astronvim.notify(string.format("wrap %s", bool2str(vim.wo.wrap)))
        end,
        desc = "Toggle wrap",
      },
      ["<leader>uI"] = { "<cmd>IndentBlanklineToggle<cr>", desc = "Toggle indent lines" },
      ["<c-w>p"] = {
        function()
          local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
          vim.api.nvim_set_current_win(picked_window_id)
        end,
        desc = "Pick a window",
      },
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
    i = {
      ["<C-k>"] = { function() vim.lsp.buf.hover() end, desc = "Hover help" },
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
      ["/"] = {function ()
        vim.api.nvim_feedkeys("", "x", true)
        vim.api.nvim_feedkeys("/\\%V", "n", true)
      end},
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
      -- ["kevinhwang91/nvim-ufo"] = {
      --   requires = "kevinhwang91/promise-async",
      --   config = function()
      --     require("ufo").setup {
      --       provider_selector = function(bufnr, filetype, buftype) return { "treesitter", "indent" } end,
      --     }
      --   end,
      -- },
      -- :me: colorschemes
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
    ["nvim-autopairs"] = { disable = true },
    -- :me: added few more hotkeys to telescope
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
      ensure_installed = { "lua", "python", "markdown", "help", "bash" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
    ["window-picker"] = { use_winbar = "never", filter_rules = { bo = { buftype = {} } } },
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

  ["heirline"] = {},

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

    -- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
   keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs"
    }, --   callback = function(args)
    --     if not vim.bo[args.buf].readonly and vim.fn.filereadable() then vim.cmd "silent! write" end
    --   end,
    --   desc = "Autosave",
    -- })

    -- vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" },
    --   { pattern = { "term://*", }, command = "startinsert", desc = "Terminal auto insert" })

    -- auto insert mode when creating terminals, entering from another buffer
    -- and when switching to a terminal in a split window
    vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "BufEnter" }, {
      pattern = { "term://*" },
      command = "setlocal! nospell | normal! i",
    })

    vim.api.nvim_create_autocmd({ "TermLeave", "BufWinLeave", "BufLeave" }, {
      pattern = { "term://*" },
      command = "normal! ",
    })

    -- vim-visual-multi configs
    vim.api.nvim_exec(
      [[
        let g:VM_default_mappings = 0
        let g:VM_theme = 'ocean'

        let g:VM_Mono_hl   = 'DiffText'
        let g:VM_Extend_hl = 'DiffAdd'
        let g:VM_Cursor_hl = 'Visual'
        let g:VM_Insert_hl = 'DiffChange'

        "to view the keys proper names for mapping check out vim-visual-multi/autoload/vm/maps/all.vim
        let g:VM_maps = {}

        let g:VM_maps['Add Cursor Up'] = '<M-Up>'
        let g:VM_maps['Add Cursor Down'] = '<M-Down>'
        let g:VM_maps['Add Cursor At Pos'] = '<M-a>'
        let g:VM_maps['Find Under'] = '<M-n>'
        let g:VM_maps['Find Subword Under'] = '<M-n>'
        " let g:VM_maps['Start Regex Search'] = '<M-/>'
        ]],
      false
    )

    -- vim.api.nvim_create_user_command("Preview markdown", function()
    --   local current_filepath = vim.api.nvim_buf_get_name(0)
    --   local command = 'livedown start ' .. current_filepath .. ' --open --browser "firefox -P livedown"'
    --   handle = vim.loop.spawn(command, { args = {} }, function() end)
    -- end)

    -- vim.api.nvim_create_user_command("Shutdown markdown preview", function ()
    --   handle:close()
    -- end)
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
