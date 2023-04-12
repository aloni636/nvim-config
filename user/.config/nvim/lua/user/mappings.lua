local mappings = {
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
					sort_mru = true,
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
		["<leader>uI"] = { "<cmd>IndentBlanklineToggle<cr>", desc = "Toggle indent lines" },
		-- convenient toggle terminal
		["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		-- better substitute
		[":S"] = { ":%s//&/g<left><left><left><left>", desc = "Global substitute" },
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
		[":S"] = { ":s/\\%V/&/g<left><left><left><left>", desc = "Selection substitute" },
	},
	o = {
		["ac"] = { name = "code (treesitter)" },
		["ic"] = { name = "code (treesitter)" },
		-- for available node groups view completion options, or at:
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/CONTRIBUTING.md
		["acf"] = { "<cmd>TSTextobjectSelect @function.outer<cr>", desc = "a function definition" },
		["icf"] = { "<cmd>TSTextobjectSelect @function.inner<cr>", desc = "inner function definition" },
		["acc"] = { "<cmd>TSTextobjectSelect @class.outer<cr>", desc = "a class definition" },
		["icc"] = { "<cmd>TSTextobjectSelect @class.inner<cr>", desc = "inner class definition" },
		["acp"] = { "<cmd>TSTextobjectSelect @parameter.outer<cr>", desc = "a parameter" },
		["icp"] = { "<cmd>TSTextobjectSelect @parameter.inner<cr>", desc = "inner parameter" },
		["aco"] = { "<cmd>TSTextobjectSelect @loop.outer<cr>", desc = "a loop" },
		["ico"] = { "<cmd>TSTextobjectSelect @loop.inner<cr>", desc = "inner loop" },
		["acd"] = { "<cmd>TSTextobjectSelect @conditional.outer<cr>", desc = "a conditional block" },
		["icd"] = { "<cmd>TSTextobjectSelect @conditional.inner<cr>", desc = "inner conditional element" },
		["acl"] = { "<cmd>TSTextobjectSelect @call.outer<cr>", desc = "a call" },
		["icl"] = { "<cmd>TSTextobjectSelect @call.inner<cr>", desc = "inner call parameters" },
		["aca"] = { "<cmd>TSTextobjectSelect @assignment.outer<cr>", desc = "an assignment" },
		["ica"] = { "<cmd>TSTextobjectSelect @assignment.rhs<cr>", desc = "inner assignment value" },
		["icA"] = { "<cmd>TSTextobjectSelect @assignment.lhs<cr>", desc = "inner assignment target" },
	},
}

-- automatically add all operator-pending keymaps to visual mode
mappings.x = mappings.o

return mappings
