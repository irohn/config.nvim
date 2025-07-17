return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	event = { "BufWritePre" },
	keys = {
		{
			"<c-f>",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			desc = "Format",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "gofumpt" },
			lua = { "stylua" },
			nix = { "nixfmt", "alejandra" },
			python = { "ruff" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
		},
		format_on_save = { timeout_ms = 500 },
	},
}

-- vim: ts=2 sts=2 sw=2 et
