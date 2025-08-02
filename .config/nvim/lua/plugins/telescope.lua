return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    keys = {
      {"<leader>t", "<cmd>Telescope<cr>"},
      {"<leader>f", "<cmd>Telescope git_files<cr>"},
      {"<leader><S-f>", "<cmd>Telescope find_files<cr>"},
      -- {"<leader>r", "<cmd>Telescope live_grep<cr>"},
      {"<leader>r", "<cmd>Telescope live_grep_args<cr>"},
      {"<leader>a", "<cmd>Telescope grep_string<cr>", mode = { "n", "v" } },
      {"<leader>b", "<cmd>Telescope buffers<cr>"}
    },
    config = function()
      local telescope = require('telescope')
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup{
        extensions = {
          live_grep_args = {
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<C-f>"] = actions.to_fuzzy_refine
              }
            }
          }
        }
      }

      telescope.load_extension('fzf')
      telescope.load_extension("live_grep_args")
    end,
}
