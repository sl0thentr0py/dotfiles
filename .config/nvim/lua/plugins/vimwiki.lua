return {
  "vimwiki/vimwiki",
  event = "BufEnter *.wiki",
  keys = { "<leader>ww", "<leader>wt" },
  init = function()
    vim.g.vimwiki_global_ext = 0
  end,
}
