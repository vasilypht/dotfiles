-- Colorscheme
vim.cmd.colorscheme("onedark")

-- Common
vim.opt.wrap = false
vim.cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]]

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
