return {
  commands = {
    Norm = { cmd = "norm" },
    G = {
      cmd = "g",
    },
    V = {
      cmd = "v",
    },
  },
  defaults = {
    enable_highlighting = true,
    -- :me: inline highlighting cause weird behavior, setting it to false until
    -- https://github.com/smjonas/live-command.nvim/issues/23
    inline_highlighting = false,
    hl_groups = {
      insertion = "DiffAdd",
      deletion = "DiffDelete",
      -- deletion = false,
      change = "DiffChange",
    },
  },
}
