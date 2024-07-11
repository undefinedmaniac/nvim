-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Lazy.nvim bootstrap code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  'navarasu/onedark.nvim',
  'Yagua/nebulous.nvim',
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  dependencies = { {"nvim-lua/plenary.nvim"} }
  },

  "mbbill/undotree",
  "tpope/vim-fugitive",

  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  -- LSP Support
  { 
      'neovim/nvim-lspconfig',
  },
  -- Autocompletion
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'L3MON4D3/LuaSnip'},

  {
      'vxpm/ferris.nvim',
      opts = {
          -- your options here
      }
  },

  -- {
  --     'mrcjkb/rustaceanvim',
  --     version = '^4', -- Recommended
  --     lazy = false, -- This plugin is already lazy
  -- },

  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
      'numToStr/Comment.nvim',
      opts = {
          -- add any options here
      },
      lazy = false,
  },

  {'akinsho/toggleterm.nvim', version = "*", config = true},

  "rust-lang/rust.vim",
}

local opts = {}

require("lazy").setup(plugins, opts)

