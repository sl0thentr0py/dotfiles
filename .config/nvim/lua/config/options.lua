local opt = vim.opt

opt.clipboard = "unnamedplus"

-- Tabs. May be overriten by autocmd rules
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Searching
opt.ignorecase = true
opt.smartcase = true

-- opt.inccommand=nosplit -- TODO
-- opt.showmatch = true -- TODO

-- No swap files
opt.swapfile = false

-- visual
opt.number = true
-- opt.relativenumber = true -- TODO statuscolumn
opt.scrolloff = 10

-- mouse
opt.mouse = "a"

 -- Command-line completion mode
opt.wildmode = "longest:full,full"

-- signcolumn for upto 4 signs
opt.signcolumn = "auto:4"

-- provider hosts pinned to mise globals; packages kept fresh via mise postinstall hooks
vim.g.python3_host_prog = vim.env.HOME .. '/.local/share/mise/installs/python/latest/bin/python'
vim.g.node_host_prog = vim.env.HOME .. '/.local/share/mise/installs/node/latest/bin/neovim-node-host'
vim.g.ruby_host_prog = vim.env.HOME .. '/.local/share/mise/installs/ruby/latest/bin/neovim-ruby-host'
vim.g.loaded_perl_provider = 0

-- folding
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevel = 99
