vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/ravitemer/mcphub.nvim" },
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

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
	file_types = { "markdown", "codecompanion" },
})

require("codecompanion").setup({
	adapters = {
		anthropic = function()
			return require("codecompanion.adapters").extend("openai", {
				env = { api_key = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/anthropic-api-key.age" },
			})
		end,
		gemini = function()
			return require("codecompanion.adapters").extend("openai", {
				env = { api_key = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/gemini-api-key.age" },
			})
		end,
		openai = function()
			return require("codecompanion.adapters").extend("openai", {
				env = { api_key = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/openai-api-key.age" },
			})
		end,
	},
	extensions = {
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				make_vars = true,
				make_slash_commands = true,
				show_result_in_chat = true,
			},
		},
	},
})

vim.keymap.set("n", "<leader>aa", ":CodeCompanionChat<cr>")
vim.keymap.set("v", "<leader>ae", ":CodeCompanion ")

-- vim: ts=2 sts=2 sw=2 et
