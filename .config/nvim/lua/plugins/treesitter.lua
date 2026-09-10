return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local languages = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "elixir",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "ruby",
        "rust",
        "sql",
        "tsx",
        "typescript",
        "yaml",
      }

      require("nvim-treesitter").setup()
      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "elixir",
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "ruby",
          "rust",
          "sql",
          "typescript",
          "typescriptreact",
          "yaml",
        },
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
