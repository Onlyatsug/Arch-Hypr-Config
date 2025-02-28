local config = function()
  require('lualine').setup {
    options = {
      theme = 'moonfly',
    },
  }
end

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = config,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
