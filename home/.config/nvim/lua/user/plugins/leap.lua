return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").add_default_mappings()
		-- linking to Search highlight group:
		-- vim.api.nvim_set_hl(0, "LeapMatch", {
		-- 	-- For light themes, set to 'black' or similar.
		-- 	fg = "white",
		-- 	bold = true,
		-- 	nocombine = true,
		-- })
		-- vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
		-- 	link = "Search",
		-- 	-- bg = "DarkRed",
		-- 	-- bg = "Yellow",
		-- 	-- fg = "Black",
		-- 	-- bold = true,
		-- 	-- nocombine = true,
		-- })
		-- vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
		-- 	link = "DiffAdd",
		-- 	-- bg = "DarkBlue",
		-- 	-- fg = "White",
		-- 	-- bold = true,
		-- 	-- nocombine = true,
		-- })
	end,
	lazy = false,
}
