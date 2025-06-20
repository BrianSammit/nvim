local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme
  use ({ 
      'folke/tokyonight.nvim',
      as = 'tokyonight',
      config = function()
            vim.cmd("colorscheme tokyonight")
      end

  })

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  -- Harpoon
  use 'theprimeagen/harpoon'

  -- Undotree
  use 'mbbill/undotree'

  -- Fugitive
  use 'tpope/vim-fugitive'

  -- LSP 
  
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- LSP Support
  use 'neovim/nvim-lspconfig'
  -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'

  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-buffer'

  -- Snips

use {
  'hrsh7th/nvim-cmp',
  -- config = function ()
  --   require'cmp'.setup {
  --   snippet = {
  --     expand = function(args)
  --       require'luasnip'.lsp_expand(args.body)
  --     end
  --   },
  --
  --   sources = {
  --     { name = 'luasnip' },
  --     -- more sources
  --   },
  -- }
  -- end
}

  -- autopairs
  
use "windwp/nvim-autopairs"

  -- lualine
  
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

  -- friendlySnippets
use "rafamadriz/friendly-snippets"

  -- Coment

use "numToStr/Comment.nvim"

  -- formating
  

use {
    "nvimdev/guard.nvim",
    requires = {"nvimdev/guard-collection"},
    event = "BufReadPre",

    config = function()
        local ft = require("guard.filetype")

        ft("c,cpp,json"):fmt("clang-format")

    end,

}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end
end)
