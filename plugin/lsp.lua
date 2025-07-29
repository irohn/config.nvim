vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("fidget").setup({})

require("conform").setup({
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
})

vim.keymap.set("n", "<c-f>", function()
	require("conform").format({ lsp_fallback = true })
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
					"${3rd}/busted/library",
					-- optional, plugins directory
					vim.env.HOME .. "/.local/share/ovim/site/pack/core/opt",
				},
			},
		})
	end,
	settings = {
		Lua = {
			format = {
				enable = false,
			},
		},
	},
})

vim.lsp.config("nixd", {
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
				},
				home_manager = {
					expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
				},
			},
		},
	},
})

vim.lsp.enable({
	"basedpyright",
	"bashls",
	"clangd",
	"gopls",
	"lua_ls",
	"nixd",
	"rust_analyzer",
})

-- vim: ts=2 sts=2 sw=2 et
