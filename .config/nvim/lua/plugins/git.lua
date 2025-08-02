return {
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    cmd = { "Git" },
    keys = {
      {"<leader>gll", "<cmd>Git pull<CR>"},
      {"<leader>gs", "<cmd>Git<CR>"},
      {"<leader>gb", "<cmd>Git blame<CR>"},
      {"<leader>gd", "<cmd>Gvdiffsplit<CR>"},
      {"<leader>gh", "<cmd>.GBrowse<CR>", mode = { "n", "v" }},
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre" },
    config = true,
  },
}
