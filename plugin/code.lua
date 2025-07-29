require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<s-tab>",
			dismiss = "<C-c>",
		},
	},
})

require("render-markdown").setup({
	file_types = { "markdown", "codecompanion", "Avante" },
})

require("avante").setup({
	provider = "claude",
	providers = {
		claude = {
			api_key_name = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/anthropic-api-key.age",
		},
		gemini = {
			api_key_name = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/gemini-api-key.age",
		},
		openai = {
			api_key_name = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/openai-api-key.age",
		},
	},
	windows = {
		width = 40,
	},
})

-- vim: ts=2 sts=2 sw=2 et
