return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "gofumpt" },
			lua = { "stylua" },
			nix = { "nixfmt" },
			python = { "ruff" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
		},
	},
	keys = {
		{
			"<c-f>",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			desc = "Format",
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
