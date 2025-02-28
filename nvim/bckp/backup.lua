  --config
  vim.cmd("set encoding=utf-8")

  vim.cmd("set t_Co=256")
  vim.cmd("syntax on")

  vim.cmd("set tabstop=2")
  vim.cmd("set softtabstop=2")
  vim.cmd("set shiftwidth=2")
  vim.cmd("set expandtab")
  vim.cmd("set wrap")

  vim.cmd("set smartindent")
  vim.cmd("set cursorline")
  vim.cmd("set mouse=a")
  vim.cmd("set number")
  vim.cmd("set relativenumber")
vim.cmd("set termguicolors")


vim.g.mapleader= " "

--lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
	--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6',
		 dependencies = { 'nvim-lua/plenary.nvim' }
 	},
	
  {
		"kdheepak/monochrome.nvim", priority = 1000,
	},
	
  {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"},
  
  { "nvim-tree/nvim-web-devicons", opts = {} },
  
  {
   "nvim-tree/nvim-tree.lua",
   version = "*",
   lazy = false,
   dependencies = {
      "nvim-tree/nvim-web-devicons",
   },
    config = function()
     require("nvim-tree").setup {}
   end,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config={},	
    dependencies = {
    "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
}

require("lazy").setup(plugins, opts)

--telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>o', builtin.live_grep, {})

--treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "html", "css", "python"},
  highlight = { enable = true },
  indent = { enable = true }
})

--nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 
vim.opt.termguicolors = true
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true})

--keymaps win
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--autotag
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = true
    }
  }
})

--noice
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
}

--colorschemes
--require("catppuccin").setup()
--vim.cmd.colorscheme "catppuccin
vim.cmd("colorscheme monochrome")




