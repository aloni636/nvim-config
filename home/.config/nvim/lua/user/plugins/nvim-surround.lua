return {
	"kylechui/nvim-surround",
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				-- insert = "<C-s><C-s>",
				-- insert_line = "<C-s>S",
				normal = "<C-s>",
				-- normal_cur = "<C-s>s",
				normal_line = "<C-s><C-s>",
				-- normal_cur_line = "<C-s>SS",
				insert = false,
				insert_line = false,
				-- normal = false,
				normal_cur = false,
				-- normal_line = false,
				normal_cur_line = false,
				visual = "<C-s>",
				visual_line = "<C-s><C-s>",
				delete = "d<C-s>",
				change = "c<C-s>",
			},
		})
	end,
	lazy = false,
}
