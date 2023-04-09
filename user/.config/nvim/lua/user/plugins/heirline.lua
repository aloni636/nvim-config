return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local utils = require("heirline.utils")
		local on = utils.get_highlight("Function").fg
		local off = utils.get_highlight("DiagnosticError").fg

		-- statusline component to show if autosave is enabled
		local components = {
			-- dont display it if buffer is readonly
			condition = function()
				local buf = vim.api.nvim_win_get_buf(0)
				return not vim.bo[buf].readonly
			end,
			-- when user toggles autosave via the mapping, vim.g.autosave_enabled updates
			-- and consequently the component updates
			provider = function()
				-- defined in user/mapping.lua
				if vim.g.autosave_enabled then
					return " AS" -- 
				else
					return " AS"
				end
			end,
			-- pretty colors, cause why not?
			hl = function()
				if vim.g.autosave_enabled then
					return { fg = on }
				else
					return { fg = off }
				end
			end,
		}
		-- set the position of the component relative to all others components
		-- in the statusline
		table.insert(opts.statusline, 6, components)
		return opts
	end,
}
