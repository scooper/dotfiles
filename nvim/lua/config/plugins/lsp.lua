local lspconfig = require('lspconfig')
local coq = require('coq')

-- local on_attach = function(client, bufnr)
--   if client.name == 'ruff' then
--     -- Disable hover in favor of Pyright
--     client.server_capabilities.hoverProvider = false
--   end
-- end

-- local servers = {
--   {"ruff", "ruff-lsp", {
--     on_attach = on_attach,
--   }},
--   {"pylsp", "pylsp", {
--     settings = {
--       pylsp = {
--         plugins = {
--           mypy = {
--             enabled = true,
--           }
--         }
--       }
--     }
--   }},
-- }

-- for _, conf in ipairs(servers) do
--   if (vim.fn.executable(conf[2]) == 1) then
--     lspconfig[conf[1]].setup(coq.lsp_ensure_capabilities{
--     -- lspconfig[conf[1]].setup({
--       on_attach = conf[3].on_attach,
--       flags = {
--         debounce_text_changes = 150,
--       },
--       settings = conf[3].settings
--     })
--   end
-- end


if (vim.fn.executable("ruff-lsp") == 1) then
  lspconfig.ruff.setup(coq.lsp_ensure_capabilities{
    on_attach = function(client, bufnr)
      client.server_capabilities.hoverProvider = false
    end,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

if (vim.fn.executable("jedi-language-server") == 1) then
  lspconfig.jedi_language_server.setup(coq.lsp_ensure_capabilities{
    flags = {
      debounce_text_changes = 150,
    },
  })
end

vim.cmd('COQnow -s')
