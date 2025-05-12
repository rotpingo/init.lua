require("vio.options")
require("vio.keymaps")
require("vio.snippets")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update

require("lazy").setup({
	require("vio.lazy-plugins.autoformat"),
	require("vio.lazy-plugins.autocompletion"),
	require("vio.lazy-plugins.neotree"),
	require("vio.lazy-plugins.colortheme"),
	require("vio.lazy-plugins.telescope"),
	require("vio.lazy-plugins.treesitter"),
	require("vio.lazy-plugins.lualine"),
	require("vio.lazy-plugins.gitsigns"),
	require("vio.lazy-plugins.lazydev"),
	require("vio.lazy-plugins.lsp"),
	require("vio.lazy-plugins.mason-workaround"),
	require("vio.lazy-plugins.which-key"),
	require("vio.lazy-plugins.misc"),
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
