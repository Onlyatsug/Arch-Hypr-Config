require("options")
require("keymaps")

--global
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--package manager
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.loop.fs_stat(lazypath) then
--  vim.fn.system({
--    "git",
--    "clone",
--    "--filter=blob:none",
--    "https://github.com/folke/lazy.nvim.git",
--    "--branch=stable", -- latest stable release
--    lazypath,
--  })
--end
--vim.opt.rtp:prepend(lazypath)

--require("lazy").setup(
--  "plugins",
--  {
--   change_detection = {
--    enabled = false,
--    },
--  }
--)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "monochrome",
			},
		},
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	dev = {
		path = "~/.ghq/github.com",
	},
	checker = { enabled = true },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
})

require("notify").setup({
	background_colour = "#000000",
})
