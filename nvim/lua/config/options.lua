vim.o.number = true
vim.o.guitermcolors = true

-- tabs as spaces, etc
vim.o.signcolumn = "auto"
vim.o.wrap = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

-- whitespace characters
vim.o.list = true
vim.opt.listchars:append({space = '.', tab = '>~', eol = '¬', trail='+'})

-- yank to system clipboard
vim.opt.clipboard:append({'unnamed', 'unnamedplus'})

-- show matching parenthesis
vim.o.matchparen = true
