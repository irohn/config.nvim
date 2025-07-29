vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/ravitemer/mcphub.nvim" },
	{ src = "https://github.com/ravitemer/codecompanion-history.nvim" },
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
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
	file_types = { "markdown", "codecompanion", "Avante" },
})

require("codecompanion").setup({
	adapters = {
		anthropic = function()
			return require("codecompanion.adapters").extend("anthropic", {
				env = { api_key = "cmd:cat " .. vim.env.XDG_RUNTIME_DIR .. "/agenix/anthropic-api-key.age" },
			})
		end,
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
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
		history = {
			enabled = true,
			auto_save = true,
			expiration_days = 90,
			picker_keymaps = {
				rename = { n = "r", i = "<M-r>" },
				delete = { n = "d", i = "<M-d>" },
				duplicate = { n = "<C-y>", i = "<C-y>" },
			},
			auto_generate_title = true,
			continue_last_chat = true,
			delete_on_clearing_chat = true,
		},
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
