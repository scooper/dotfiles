require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'oxocarbon',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
