require('nvim-treesitter.configs').setup{
    ensure_installed = { 'c', 'lua', 'python', 'cpp', 'bash', 'rust' },

    sync_installed = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
