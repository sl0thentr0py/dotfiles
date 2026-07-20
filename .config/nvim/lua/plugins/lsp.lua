return {
  { "mason-org/mason.nvim", cmd = "Mason", build = ":MasonUpdate", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      -- mise's `latest` Ruby can be newer than the Ruby versions supported by
      -- some of this repository's gemfiles. Keep the LSP runtime stable while
      -- Ruby LSP still uses each project's own composed bundle.
      vim.lsp.config("ruby_lsp", {
        cmd = { "mise", "exec", "ruby@3.4", "--", "ruby-lsp" },
      })
    end,
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
