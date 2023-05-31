return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-Up>"] = require("telescope.actions").results_scrolling_up,
						["<C-Down>"] = require("telescope.actions").results_scrolling_down,
						["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
						["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
						["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
					},
					n = {
						["<C-Up>"] = require("telescope.actions").results_scrolling_up,
						["<C-Down>"] = require("telescope.actions").results_scrolling_down,
						["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
						["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
						["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
					},
				},
				-- cycle from vertical with preview to one (that probably) without (i.e preview_cutoff = 120)
				cycle_layout_list = {
					{
						layout_strategy = "vertical",
						layout_config = { prompt_position = "top", mirror = true, preview_cutoff = 0 },
					},
					{
						layout_strategy = "vertical",
						layout_config = { prompt_position = "top", mirror = true },
					},
					"horizontal",
				},
				-- print the entire file path when searching for files
				-- TODO: somehow make it available only in vertical layout
				path_display = { "absolute" },
				-- wrap_results = true,
			},
			extensions = {
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = false,
					-- mappings = {
					-- ["i"] = {
					-- your custom insert mode mappings
					-- },
					-- ["n"] = {
					-- your custom normal mode mappings
					-- },
					-- },
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
		lazy = false,
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	enabled = false,
	-- },
}
