return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		-- local status = require("astronvim.utils.status")
		local utils = require("heirline.utils")
		local on = utils.get_highlight("Function").fg
		local off = utils.get_highlight("DiagnosticError").fg

		local components = {
			condition = function()
				local buf = vim.api.nvim_win_get_buf(0)
				return not vim.bo[buf].readonly
			end,
			provider = function()
				-- defined in user/mapping.lua
				if vim.g.autosave_enabled then
					return " AS" -- 
				else
					return " AS"
				end
			end,
			hl = function()
				if vim.g.autosave_enabled then
					return { fg = on }
				else
					return { fg = off }
				end
			end,
		}
		table.insert(opts.statusline, 6, components)
		return opts
	end,
}
