local lspconfig = require('lspconfig')
local coq = require('coq')

local on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

local servers = {
  {"ruff_lsp", "ruff-lsp", {
    on_attach = on_attach,
  }},
  {"pyright", "pyright-langserver", {}},
  {"clangd", "clangd", {}},
  {"rust_analyzer", "rust-analyzer", {
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        }
      }
    }
  }},
  {"ols", "ols", {}},
}

for _, conf in ipairs(servers) do
  if (vim.fn.executable(conf[2]) == 1) then
    lspconfig[conf[1]].setup(coq.lsp_ensure_capabilities{
      on_attach = conf[3].on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = conf[3].settings
    })
  end
end

lspconfig.clangd.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
