vim.g.mapleader = " "

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.inccommand = "split" -- preview substitution
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.virtualedit = "block" -- visual block ignore end of lines
vim.opt.linebreak = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
vim.opt.formatoptions:remove("o")
vim.opt.shortmess:append("c")

-- keymaps
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

-- autocmds
local augroup = function(name)
	return vim.api.nvim_create_augroup("irohn.group" .. name, { clear = true })
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

require("config.lazy")
require("config.lsp")

-- vim: ts=2 sts=2 sw=2 et
