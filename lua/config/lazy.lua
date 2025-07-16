-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

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

-- Setup lazy.nvim
require("lazy").setup({
	---@diagnostic disable-next-line: assign-type-mismatch
	dev = {
		path = "~/projects/personal",
		fallback = true,
	},
	---@type LazySpec
	spec = {
		-- import plugins directory
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { get_colorscheme("default") } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
})

-- vim: ts=2 sts=2 sw=2 et
