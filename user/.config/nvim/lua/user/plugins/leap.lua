return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").add_default_mappings()
		-- leap highlight config
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
		-- politely taken from tokyo night:
		-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua#L706
		vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
			underline = true,
			fg = "#ff007c",
		})
		vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
			underline = true,
			fg = "#73daca",
		})
		vim.api.nvim_set_hl(0, "LeapMatch", {
			bg = "#ff007c",
			bold = true,
			fg = "#c0caf5",
		})
		--
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
