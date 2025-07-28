vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.inccommand = "split" -- preview substitution
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true
vim.o.virtualedit = "block" -- visual block ignore end of lines
vim.o.linebreak = true
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.winborder = "rounded"
vim.opt.completeopt:append({ "menuone", "noselect", "noinsert", "preview" })
vim.opt.formatoptions:remove({ "o", "r" }) -- remove auto comment after newline
vim.opt.shortmess:append("c")

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>m", "<cmd>messages<cr>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("v", "<c-s>", ":sort<cr>", { silent = true, desc = "sort selection" })

local augroup = function(name)
	return vim.api.nvim_create_augroup("irohn." .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight-on-yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	group = augroup("resize-splits"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et
