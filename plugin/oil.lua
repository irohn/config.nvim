vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup()

vim.keymap.set("n", "-", ":Oil<CR>")

-- vim: ts=2 sts=2 sw=2 et
