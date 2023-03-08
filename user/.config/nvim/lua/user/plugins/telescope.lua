return {
  defaults = {
    mappings = {
      i = {
        ["<C-Up>"] = require("telescope.actions").results_scrolling_up,
        ["<C-Down>"] = require("telescope.actions").results_scrolling_down,
        ["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
        ["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-g>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
      },
      n = {
        ["<C-Up>"] = require("telescope.actions").results_scrolling_up,
        ["<C-Down>"] = require("telescope.actions").results_scrolling_down,
        ["<PageUp>"] = require("telescope.actions").preview_scrolling_up,
        ["<PageDown>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-g>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
      },
    },
    layout_strategy = "horizontal",
    layout_config = { vertical = { preview_cutoff = 0, mirror = true }, prompt_position = "top" },
    cycle_layout_list = { "vertical", "horizontal" },
  },
}
