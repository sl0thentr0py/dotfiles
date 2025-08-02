return {
  { "mason-org/mason.nvim", cmd = "Mason", build = ":MasonUpdate", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
  "neovim/nvim-lspconfig",
}
--   {
--     "neovim/nvim-lspconfig",
--     event = { "BufReadPost", "BufNewFile" },
--     dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
--     config = function()
--       require("mason").setup()
--       require("mason-lspconfig").setup()
--       require("mason-lspconfig").setup_handlers {
--         function(server)
--           require("lspconfig")[server].setup {
--             on_attach = function(client, buffer)
--               opts = { buffer = buffer }
--               vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--               vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--               vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
--               vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
--               vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
--               vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
--               -- TODO renames
--             end,
--           }
--         end,
--       }
--     end,
--   },
-- }
