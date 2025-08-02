return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  { "tpope/vim-vinegar", keys = { "-" } },
  { "folke/zen-mode.nvim" }
}
