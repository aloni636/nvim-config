return {
	"folke/which-key.nvim",
	-- disable which-key for custom command completion (mappings which start with ":")
	opts = { triggers_blacklist = { n = { ":" }, v = { ":" } } },
}
