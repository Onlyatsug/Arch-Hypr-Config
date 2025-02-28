return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    event = "VimEnter",
    keys = {
      {
        "<leader>p",
        "<cmd>Telescope find_files<CR>",
      },
      {
        "<leader>o",
        "<cmd>Telescope live_grep<CR>",
      },
    },
    lazy = true,
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "-u",
          "-u",

          "--iglob", "!.git",
          "--iglob", "!node_modules",
          "--iglob", "!public",
          "--iglob", "!tmp",
          "--iglob", "!storage",
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--smart-case",
            "-u",

            "--files",
            "--iglob", "!.git",
            "--iglob", "!node_modules",
            "--iglob", "!public",
            "--iglob", "!tmp",
            "--iglob", "!storage",
            "--hidden",
          },
          path_display = { "truncate" },
        },
      },
    },
  },
}
