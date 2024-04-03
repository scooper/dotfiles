local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugin-setup.lua",
    command = "source <afile> | PackerSync",
    group = group,
})