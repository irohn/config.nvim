return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"Kaiser-Yang/blink-cmp-avante",
		},
		version = "1.*",
		---@module "blink.cmp"
		---@type blink.cmp.Config
		opts = {
			sources = {
				-- Add 'avante' to the list
				default = { "lsp", "path", "avante", "buffer" },
				providers = {
					avante = {
						module = "blink-cmp-avante",
						name = "Avante",
						opts = {},
					},
				},
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
