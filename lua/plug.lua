local packer = require"packer"

local use = packer.use

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- dependency for nvim plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  use 'szw/vim-maximizer'


  -- snippet support
  use "hrsh7th/vim-vsnip"
  use "windwp/nvim-autopairs"
  use {
     "rafamadriz/friendly-snippets",
     event = "InsertEnter",
  }

  -- git
  use {
    "lewis6991/gitsigns.nvim",
    opt = true,
  }

  -- Debugging
  use {
    'puremourning/vimspector',
    config = [[require"config.vimspector"]]
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require"config.lua-lang-server"
      require "config.nvim-lspconfig"
    end
  }

  use "onsails/lspkind-nvim"
  use 'tjdevries/nlua.nvim'
  use 'tjdevries/lsp_extensions.nvim'

  use {
    'hrsh7th/nvim-cmp',
    after = "friendly-snippets",
    config = [[require"config.cmp"]]
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  }
  -- FZF
  use{
    'nvim-telescope/telescope.nvim',
    config = [[require"config.telescope-nvim"]]
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require "config.treesitter-nvim"]]
  }

  -- Help please
  use {
    "folke/which-key.nvim",
    config = [[require "config.whichkey"]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = [[require('config.nvimtree')]]
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
         require("config.others").blankline()
    end,
  }

  -- lines 
  use {
    'akinsho/nvim-bufferline.lua',
    config = [[require'config.nvim-bufferline']],
    requires = 'kyazdani42/nvim-web-devicons'
  }
  --use "glepnir/galaxyline.nvim"
  use {
    -- 'famiu/feline.nvim'
    'abellaismail7/galaxyline.nvim',
    config = [[ require'config.statusline']]
  }

  -- Theme
  use 'ap/vim-css-color'
  use 'kyazdani42/nvim-web-devicons'
  use 'sheerun/vim-polyglot'

  use {
    'glepnir/dashboard-nvim',
    config = [[require"config.nvim-dashboard"]]
  }
  use {
    'dracula/vim',
  }
end)