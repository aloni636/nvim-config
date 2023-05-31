return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, config)
		-- config variable is the default configuration table for the setup function call
		-- local null_ls = require "null-ls"

		-- Check supported formatters and linters
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local null_ls = require("null-ls")
		config.sources = {
			-- null_ls.builtins.formatting.stylua,
			-- null_ls.builtins.diagnostics.pylint,
			-- use custom defaults defined in linter-config dir
			-- null_ls.builtins.diagnostics.selene.with({
			-- Check if :pwd contains selene.toml file
			-- If not, fallback to default config file found in ~/.config/nvim/lua/user/linter-configs/
			-- 	cwd = function(_params)
			-- 		local session_cwd = vim.fn.getcwd()
			-- 		if vim.fn.filereadable(session_cwd .. "/selene.toml") == 1 then
			-- 			return vim.fn.expand(session_cwd)
			-- 		else
			-- 			return vim.fn.expand("~/.config/nvim/lua/user/linter-configs/") -- fallback value
			-- 		end
			-- 	end,
			-- }),
		}
		return config -- return final config table
	end,
}
