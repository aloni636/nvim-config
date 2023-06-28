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
        -- globals = { "vim", "require", "astronvim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          -- read this to configure detection of local lua_modules
          -- https://github.com/LuaLS/lua-language-server/wiki/Libraries#link-to-workspace
          -- tldr: use workspace.library in .luarc.json project-wide file
        },
        -- https://github.com/LuaLS/lua-language-server/wiki/Settings
        checkThirdParty = false,
        maxPreload = 5000,
        preloadFileSize = 10000,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      -- telemetry = {
      --   enable = false,
      -- },
    },
  },
}
