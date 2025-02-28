return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
  keys = {
    {"<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true}},
    {"<leader>f", ":NvimTreeToggle<CR>", {noremap = true, silent = true}}
  },
  config = function()
    require("nvim-tree").setup()
  end
}
