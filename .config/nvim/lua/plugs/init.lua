--Plugin manager


--Check if packer is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end


return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'sainnhe/everforest'
    use 'sainnhe/gruvbox-material'
    use 'jiangmiao/auto-pairs'
    use {'lewis6991/gitsigns.nvim',
        config = function() require('plugs.configs.gitsigns') end
    }

    use {'akinsho/bufferline.nvim',
        config = function() require('plugs.configs.buffer') end
    }
    use {'glepnir/dashboard-nvim',
        config = function() require('plugs.configs.dashboard') end
    }

    use {'nvim-treesitter/nvim-treesitter',
        config = function() require('plugs.configs.treesitter') end
    }

    use {'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require('plugs.configs.statusline') end
    }

    use {'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugs.configs.filemanager') end
    } 
end)

