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

vim.g.python3_host_prog = '/Users/neel/.asdf/installs/python/3.12.7/bin/python'
