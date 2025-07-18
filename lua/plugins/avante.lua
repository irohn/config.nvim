return {
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "Avante" },
				},
				ft = { "Avante" },
			},
		},
		---@module "avante"
		---@type avante.Config
		opts = {
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
				copilot = {
					endpoint = "https://api.githubcopilot.com",
					proxy = nil,
					allow_insecure = false,
					timeout = 10 * 60 * 1000,
					max_completion_tokens = 1000000,
					reasoning_effort = "high",
					model = "gpt-4.1",
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
			},
			windows = {
				width = 40,
			},
		},
		keys = {
			{
				"<leader>ac",
				"<cmd>AvanteChatNew<cr>",
				desc = "New Avante Chat",
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
