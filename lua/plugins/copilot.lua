return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = { "irohn/nix" },
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					dismiss = "<C-c>",
				},
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
