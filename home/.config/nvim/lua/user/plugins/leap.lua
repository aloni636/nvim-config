return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").add_default_mappings()
     -- politely taken from tokyo night:
     -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua#L706
		-- local highlights = {
		-- 	LeapBackdrop = {
		-- 		fg = "#545c7e"
		-- 	},
		-- 	LeapLabelPrimary = {
		-- 		bold = true,
		-- 		fg = "#ff007c"
		-- 	},
		-- 	LeapLabelSecondary = {
		-- 		bold = true,
		-- 		fg = "#4fd6be"
		-- 	},
		-- 	LeapMatch = {
		-- 		bg = "#ff007c",
		-- 		bold = true,
		-- 		fg = "#c8d3f5"
		-- 	},
		-- }
		-- for name, configs in pairs(highlights) do
		-- 	vim.api.nvim_set_hl(0, name, configs)
		-- end
	end,
	lazy = false,
}
