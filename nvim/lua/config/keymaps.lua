-- general
vim.keymap.set('n', '<c-s>', ':w<CR>')
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
vim.keymap.set('n', '<leader>i', ':lua vim.diagnostic.open_float()<CR>')

-- buffer deletion
vim.keymap.set('n', '<leader>bd', ':Bdelete<CR>')

-- nvim-tree
vim.keymap.set('n', '<leader>to', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')

-- telescope
local builtin = require('telescope.builtin')
local ivy = require('telescope.themes').get_ivy()
vim.keymap.set('n', '<leader>sf', function() builtin.find_files(ivy) end, {})
vim.keymap.set('n', '<leader>sw', function() builtin.grep_string(ivy) end, {})
vim.keymap.set('n', '<leader>sg', function() builtin.live_grep(ivy) end, {})
vim.keymap.set('n', '<leader>s.', function() builtin.oldfiles(ivy) end, {})
vim.keymap.set('n', '<leader>sd', function() builtin.diagnostics(ivy) end, {})
vim.keymap.set('n', '<leader><leader>', function() builtin.buffers(ivy) end, {})
vim.keymap.set('n', '<leader>ss', function() builtin.builtin(ivy) end, {})
vim.keymap.set('n', '<leader>sh', function() builtin.help_tags(ivy) end, {})

vim.keymap.set('n', '<leader>so', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

-- lsp
---- global mappings.
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

---- map after lsp is attached
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

-- persistence
persistence = require('persistence')
vim.keymap.set('n', '<leader>Sl', function() persistence.load() end)
vim.keymap.set('n', '<leader>Ss', function() persistence.select() end)
