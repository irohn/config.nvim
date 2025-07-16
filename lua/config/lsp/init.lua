local servers = {}
local lsp_config_dir = vim.fn.stdpath("config") .. "/lua/config/lsp"
local files = vim.fn.globpath(lsp_config_dir, "*.lua", false, true)

for _, file in ipairs(files) do
	local fname = vim.fn.fnamemodify(file, ":t:r")
	if fname ~= "init" and vim.fn.fnamemodify(file, ":e") == "lua" then
		require("config.lsp." .. fname)
		table.insert(servers, fname)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("irohn.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { buffer = args.buf, desc = "Go to definition" })

		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, { buffer = args.buf, desc = "Go to declaration" })

		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, { buffer = args.buf, desc = "Go to implementation" })

		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, { buffer = args.buf, desc = "Go to references" })

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { buffer = args.buf, desc = "Show hover information" })

		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, { buffer = args.buf, desc = "Rename symbol" })

		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, { buffer = args.buf, desc = "Code action" })

		vim.keymap.set("n", "<leader>di", function()
			vim.diagnostic.open_float(nil, { focusable = false })
		end, { buffer = args.buf, desc = "Show diagnostics" })
	end,
})

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})

-- vim: ts=2 sts=2 sw=2 et
