return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "moonfly", -- tokyonight-night, or the default "astrodark"
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- substitute boilerplate
    vim.api.nvim_create_user_command("S", function(opts)
        local visual = opts.range == 2 and "\\%V" or ""
        local cmd = ":%s/" .. visual .. "/&/g" .. ("<left>"):rep(4)
        cmd = vim.api.nvim_replace_termcodes(cmd, true, true, true)
        vim.fn.feedkeys(cmd, "n")
      end,
      { force = true, range = true })
    -- auto insert mode when creating terminals, entering from another buffer
    -- and when switching to a terminal in a split window
    -- vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "BufEnter" }, {
    --   pattern = { "term://*" },
    --   command = "setlocal! nospell | normal! i",
    -- })
    --
    -- vim.api.nvim_create_autocmd({ "TermLeave", "BufWinLeave", "BufLeave" }, {
    --   pattern = { "term://*" },
    --   command = "stopinsert",
    -- })
    -- force vim to not map <Tab> to <c-i>
    -- credits: https://www.reddit.com/r/neovim/comments/vguomm/how_can_i_map_tab_but_keep_the_default_action_for/
    vim.cmd("nnoremap <c-i> <c-i>")
    -- vim.api.nvim_create_user_command("MarkdownShow", function()
    --   local current_filepath = vim.api.nvim_buf_get_name(0)
    --   local cmd = "livedown start " .. current_filepath .. ' --open --browser "firefox -P livedown"'
    --   local job_id = vim.fn.jobstart(cmd)
    --   vim.g.markdown_previewer_job_id = job_id
    -- end, {})

    -- vim.api.nvim_create_user_command("MarkdownShutdown", function()
    --   local job_id = vim.g.markdown_previewer_job_id
    --   vim.fn.jobstop(job_id)
    -- end, {})

    -- politely taken from tokyo night:
    -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua#L706
    local function leap_colorscheme(_)
        local highlights = {
          LeapBackdrop = {
            fg = "#545c7e"
          },
          LeapLabelPrimary = {
            bold = true,
            fg = "#ff007c"
          },
          LeapLabelSecondary = {
            bold = true,
            fg = "#4fd6be"
          },
          LeapMatch = {
            bg = "#ff007c",
            bold = true,
            fg = "#c8d3f5"
          },
        }
        for name, configs in pairs(highlights) do
          vim.api.nvim_set_hl(0, name, configs)
        end
      end
    -- force leap colorscheme after plugins loaded and after eahc colorscheme change
    leap_colorscheme()
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      callback = leap_colorscheme
    })

  end,
}
