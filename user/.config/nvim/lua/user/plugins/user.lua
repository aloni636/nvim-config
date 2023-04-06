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
	-- {
	-- 	"danymat/neogen",
	-- 	requires = "nvim-treesitter/nvim-treesitter",
	-- 	config = function()
	-- 		require("neogen").setup({ snippet_engine = "luasnip" })
	-- 	end,
	-- 	lazy = false
	-- },
}
