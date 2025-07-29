vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	win_options = {
		signcolumn = "yes:3",
		number = false,
		relativenumber = false,
	},
	keymaps = {
		["gd"] = {
			desc = "Toggle file detail view",
			callback = (function()
				local detail = false
				return function()
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end
			end)(),
		},
	},
	view_options = {
		show_hidden = true,
	},
	float = {
		max_width = 0.5,
		max_height = 0.5,
		border = "rounded",
	},
})

vim.keymap.set("n", "-", function()
	require("oil").open_float()
end)

-- vim: ts=2 sts=2 sw=2 et
