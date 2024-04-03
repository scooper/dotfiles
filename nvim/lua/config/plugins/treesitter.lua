require('nvim-treesitter.configs').setup{
    ensure_installed = { 'c', 'lua', 'python', 'cpp', 'bash' },

    sync_installed = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}