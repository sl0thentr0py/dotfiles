return {
  { "mason-org/mason.nvim", cmd = "Mason", build = ":MasonUpdate", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        end,
      })
    end,
  },
}
