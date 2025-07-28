vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

local snacks = require("snacks")

require("snacks").setup({
	bigfile = { enabled = true },
	explorer = { enabled = true },
	input = { enabled = true },
	picker = {
		enabled = true,
		sources = {
			colorschemes = {
				confirm = function(picker, item)
					vim.g.snacks_colors_confirm = true
					snacks.picker.sources.colorschemes.confirm(picker, item)
					save_colorscheme(item.text)
				end,
				on_close = function()
					if vim.g.snacks_colors_confirm ~= true then
						pcall(vim.cmd.colorscheme, get_colorscheme())
					end
					vim.g.snacks_colors_confirm = nil
				end,
				on_change = function(_, item)
					if item then
						pcall(vim.cmd.colorscheme, item.text)
					end
				end,
				layout = { preset = "default" },
			},
		},
	},
	quickfile = { enabled = true },
	statuscolumn = { enabled = true },
})

local keymaps = {
	{
		"<leader><leader>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	{
		"<leader>fb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>fg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>:",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>fn",
		function()
			Snacks.picker.notifications()
		end,
		desc = "Notification History",
	},
	{
		"<leader>fh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<leader>fk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>s",
		function()
			Snacks.picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<leader>sh",
		function()
			Snacks.picker.search_history()
		end,
		desc = "Search History",
	},
	{
		"<leader>sD",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>sd",
		function()
			Snacks.picker.diagnostics_buffer()
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>sm",
		function()
			Snacks.picker.marks()
		end,
		desc = "Marks",
	},
	{
		"<leader>su",
		function()
			Snacks.picker.undo()
		end,
		desc = "Undo Histry",
	},
	{
		"<leader>th",
		function()
			Snacks.picker.colorschemes()
		end,
		desc = "Colorschemes",
	},
	{
		"<leader>gb",
		function()
			Snacks.picker.git_branches()
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gL",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log_line()
		end,
		desc = "Git Log Line",
	},
	{
		"<leader>gs",
		function()
			Snacks.picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<leader>gS",
		function()
			Snacks.picker.git_stash()
		end,
		desc = "Git Stash",
	},
	{
		"<leader>gd",
		function()
			Snacks.picker.git_diff()
		end,
		desc = "Git Diff (Hunks)",
	},
	{
		"<leader>gf",
		function()
			Snacks.picker.git_log_file()
		end,
		desc = "Git Log File",
	},
}

for _, map in ipairs(keymaps) do
	vim.keymap.set("n", map[1], map[2], { desc = map.desc, silent = true })
end

-- vim: ts=2 sts=2 sw=2 et
