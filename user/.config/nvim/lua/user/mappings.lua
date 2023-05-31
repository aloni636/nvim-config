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
				-- run from cmdline to get native vim cmdline error messages
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<cmd>wall!<cr>", true, true, true), "m", false)
			end,
			desc = "Toggle autosave",
		},
		-- leave leader-e to telescope-file-browser
		-- ["<leader>e"] = { "<cmd>Telescope file_browser<cr>", desc = "Toggle Explorer" },
		["<C-i>"] = false,
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
		["<leader>fp"] = {
			function()
				require("telescope.builtin").builtin({ include_extensions = true })
			end,
			desc = "Find pickers",
		},
		-- telescope spell suggest
		["z="] = {
			function()
				require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
			end,
		},
		-- tab buffer switcher
		-- not <Tab>, as <Tab> == <Ctrl-i> for terminals (god knows why)
		["<S-Tab>"] = {
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
			desc = "Find buffer content",
		},
		["<leader>um"] = {
			function()
				require("mini.map").toggle()
			end,
			desc = "Toggle minimap",
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
		["<C-j>"] = {"<Down>"},
		["<C-k>"] = {"<Up>"},
		["<C-l>"] = {"<Right>"},
		["<C-h>"] = {"<Left>"},
		["<C-Right>"] = { "<esc>lwi" },
		["<C-Left>"] = { "<esc>gea" },
	},
	v = {
		["<S-j>"] = { "<esc><cmd>'<,'>m '>+1<cr>gv", desc = "Move line down" },
		["<S-k>"] = { "<esc><cmd>'<,'>m '<-2<cr>gv", desc = "Move line up" },
		["<C-j>"] = { "<esc><cmd>'<,'>t '><cr>`[V`]", desc = "Copy line down" },
		["<C-k>"] = { "<esc><cmd>'<,'>t '<-1<cr>`[V`]o", desc = "Copy line up" },

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
		-- ["ac"] = { name = "code (treesitter)" },
		-- ["ic"] = { name = "code (treesitter)" },
		-- for available node groups view completion options, or at:
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/CONTRIBUTING.md
		["af"] = { "<cmd>TSTextobjectSelect @function.outer<cr>", desc = "a TS function" },
		["if"] = { "<cmd>TSTextobjectSelect @function.inner<cr>", desc = "inner TS function" },
		["ac"] = { "<cmd>TSTextobjectSelect @class.outer<cr>", desc = "a TS class" },
		["ic"] = { "<cmd>TSTextobjectSelect @class.inner<cr>", desc = "inner TS class" },
		["ap"] = { "<cmd>TSTextobjectSelect @call.inner<cr>", desc = "around TS parameters" },
		["ip"] = { "<cmd>TSTextobjectSelect @parameter.inner<cr>", desc = "inner TS parameter" },
		["al"] = { "<cmd>TSTextobjectSelect @loop.outer<cr>", desc = "a TS loop" },
		["il"] = { "<cmd>TSTextobjectSelect @loop.inner<cr>", desc = "inner TS loop" },
		["an"] = { "<cmd>TSTextobjectSelect @conditional.outer<cr>", desc = "a TS conditional" },
		["in"] = { "<cmd>TSTextobjectSelect @conditional.inner<cr>", desc = "inner TS conditional" },
		-- ["al"] = { "<cmd>TSTextobjectSelect @call.outer<cr>", desc = "a TS call" },
		-- ["il"] = { "<cmd>TSTextobjectSelect @call.inner<cr>", desc = "inner TS call parameters" },
		["aa"] = { "<cmd>TSTextobjectSelect @assignment.outer<cr>", desc = "a TS assignment" },
		["ia"] = { "<cmd>TSTextobjectSelect @assignment.rhs<cr>", desc = "inner TS assignment" },
		["iA"] = { "<cmd>TSTextobjectSelect @assignment.lhs<cr>", desc = "inner TS assignee" },
	},
}

-- automatically add all operator-pending keymaps to visual mode
mappings.x = mappings.o
mappings.n["<C-/>"] = mappings.n["<C-_>"]

-- automatically inherit custom arrows based likewise ops
mappings.v["<S-Down>"] = mappings.v["<S-j>"]
mappings.v["<S-Up>"] = mappings.v["<S-k>"]
mappings.v["<C-Down>"] = mappings.v["<C-j>"]
mappings.v["<C-Up>"] = mappings.v["<C-k>"]

return mappings
