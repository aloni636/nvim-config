return {
  settings = {
    Lua = {
      runtime = {
        version = "Lua 5.1",
        -- path = {
        --   "?.lua",
        --   '?.lua',
        --   '?/init.lua',
        --   vim.fn.expand (vim.fn.getcwd() .. '/lua_modules/share/lua/5.1/?.lua'),
        --   vim.fn.expand'./lua_modules/share/lua/5.1/?/init.lua'
        --   '/usr/share/5.3/?.lua',
        --   '/usr/share/lua/5.3/?/init.lua'
        -- }
      },
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
      diagnostics = {
        enable = true,
        globals = { "vim", "require", "astronvim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          unpack(vim.api.nvim_get_runtime_file("", true)),
          -- vim.fn.expand'./lua_modules/share/lua/5.1',
          -- "lua_modules/share/lua/5.1"
          -- unpack(vim.fs.find(function(name, path)
          --   return name:match(".+%.lua$") and path:match("lua_modules/share")
          -- end, { path = vim.fn.getcwd(), limit = math.huge })),
          -- unpack(vim.fs.find(function(name, path)
          --   return name:match(".+%.lua$") and path:match("lua_modules")
          -- end, { path = vim.fn.getcwd(), limit = math.huge })),
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
