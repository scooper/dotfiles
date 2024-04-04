local lspconfig = require('lspconfig')
local coq = require('coq')

lspconfig.pylsp.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
