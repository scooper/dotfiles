local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
        return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'
    use { 
        'ms-jpq/coq_nvim', branch = 'coq',
        requires = { {'ms-jpq/coq.artifacts', branch = 'artifacts'} }
    }
    use 'nvim-lualine/lualine.nvim'
    use 'shaunsingh/nord.nvim'
    use { 
	    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    	requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'alexghergh/nvim-tmux-navigation'
    use { 
        'altermo/ultimate-autopair.nvim',
        event = {'InsertEnter','CmdlineEnter'},
        branch = 'v0.6',
        config=function ()
            require('ultimate-autopair').setup{}
        end,
    }
    use 'nmac427/guess-indent.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
