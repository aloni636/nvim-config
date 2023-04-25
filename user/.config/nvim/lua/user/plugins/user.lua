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
		event = "LspAttach",
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
