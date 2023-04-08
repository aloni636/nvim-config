return {
	-- first key is the mode
	n = {
		["<leader>w"] = { "<cmd>wall! <cr>", desc = "Save all" },
		["<leader>q"] = { "<cmd>silent! wall | quitall<cr>", desc = "Save all & quit" },
		["<leader>a"] = {
			function()
				require("auto-save").toggle()
				-- used in user/plugins/heirline.lua
				vim.g.autosave_enabled = not vim.g.autosave_enabled
				-- automatically save when toggling autosave
				vim.cmd("wall!")
			end,
			desc = "Toggle autosave",
		},
		-- leave ctrl-s to nvim-surround
		["<C-s>"] = false,
		-- ["<leader>tb"] = {
		-- 	function()
		-- 		require("astronvim.utils").toggle_term_cmd("btop --utf-force")
		-- 	end,
		-- 	desc = "ToggleTerm btop",
		-- },
		-- search for all man pages, not just (1)
		["<leader>fm"] = {
			function()
				require("telescope.builtin").man_pages({ sections = { "ALL" } })
			end,
			desc = "Search man pages",
		},
		["<leader>fO"] = { require("telescope.builtin").vim_options, desc = "Find vim options" },
		["<leader>fp"] = { require("telescope.builtin").builtin, desc = "Find pickers" },
		-- telescope spell suggest
		["z="] = {
			function()
				require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
			end,
		},
		-- tab buffer switcher
		["<Tab>"] = {
			function()
				require("telescope.builtin").buffers({
					sort_lastused = true,
					ignore_current_buffer = true,
					cache_picker = false,
				})
			end,
		},
		-- ctrl-/ for fuzzy search
		["<C-_>"] = {
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({
					cache_picker = false,
					skip_empty_lines = true,
				})
			end,
			desc = "Search buffer",
		},
		-- word wrap instead of character wrap
		["<leader>uw"] = {
			function()
				vim.wo.wrap = not vim.wo.wrap
				if vim.wo.wrap then
					vim.cmd("set wrap linebreak nolist bri")
				else
					vim.cmd("set nowrap nolinebreak list nobri")
				end
				local bool2str = function(bool)
					return bool and "on" or "off"
				end
				astronvim.notify(string.format("wrap %s", bool2str(vim.wo.wrap)))
			end,
			desc = "Toggle wrap",
		},
		["<leader>uI"] = { "<cmd>IndentBlanklineToggle<cr>", desc = "Toggle indent lines" },
		-- convenient toggle terminal
		["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		-- better substitute
		[":s"] = { ":%s//&/g<left><left><left><left>", desc = "Global substitute" },
	},
	t = {
		["<C-\\>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
	},
	i = {
		["<C-k>"] = {
			function()
				vim.lsp.buf.hover()
			end,
			desc = "Hover help",
		},
		["<C-j>"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			desc = "Signature help",
		},
	},
	v = {
		-- visual selection send to terminal
		["<leader>e"] = {
			function()
				return vim.api.nvim_get_mode().mode == "V" and "<esc><cmd>'<,'>ToggleTermSendVisualLines<cr>"
					or "<esc><cmd>'<,'>ToggleTermSendVisualSelection<cr>"
			end,
			expr = true,
			desc = "Execute in terminal",
		},
		["/"] = { "<esc>/\\%V" },
		-- better substitute
		[":s"] = { ":s/\\%V/&/g<left><left><left><left>", desc = "Selection substitute" },
	},
}
