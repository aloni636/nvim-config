return {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup(require( "user.plugins.custom-plugins." .. "nvim-surround-config"))
    end,
  },
  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
  },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require("cinnamon").setup(require( "user.plugins.custom-plugins." .. "cinnamon-config"))
    end,
    disable=true
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    -- disable = true,
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup({})
    end,
  },
  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup(require( "user.plugins.custom-plugins." .. "live-command-config"))
    end,
  },
  {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup(require( "user.plugins.custom-plugins." .. "tokyonight-config"))
    end,
  },
  { "mg979/vim-visual-multi", config = {} },
}
