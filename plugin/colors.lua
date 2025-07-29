vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/rebelot/kanagawa.nvim", name = "kanagawa" },
	{ src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim", name = "gruvbox" },
	{ src = "https://github.com/olimorris/onedarkpro.nvim", name = "onedarkpro" },
	{ src = "https://github.com/vague2k/vague.nvim", name = "vague" },
	{ src = "https://github.com/webhooked/kanso.nvim", name = "kanso" },
	{ src = "https://github.com/EdenEast/nightfox.nvim", name = "nightfox" },
	{ src = "https://github.com/scottmckendry/cyberdream.nvim", name = "cyberdream" },
})

---@param fallback? string
_G.get_colorscheme = function(fallback)
	if not vim.g.COLORS_NAME then
		vim.cmd.rshada()
	end
	if not vim.g.COLORS_NAME or vim.g.COLORS_NAME == "" then
		return fallback or "default"
	end
	return vim.g.COLORS_NAME
end

---@param colorscheme? string
_G.save_colorscheme = function(colorscheme)
	colorscheme = colorscheme or vim.g.colors_name
	if get_colorscheme() == colorscheme then
		return
	end
	vim.g.COLORS_NAME = colorscheme
	vim.cmd.wshada()
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		pcall(vim.cmd.colorscheme, get_colorscheme())
		return vim.g.colors_name == get_colorscheme("default")
	end,
})

vim.keymap.set("n", "<leader>th", function()
	local colors = vim.fn.getcompletion("", "color")
	vim.ui.select(colors, { prompt = "colorscheme" }, function(choice)
		if choice then
			vim.cmd.colorscheme(choice)
			save_colorscheme(choice)
		end
	end)
end)

-- vim: ts=2 sts=2 sw=2 et
