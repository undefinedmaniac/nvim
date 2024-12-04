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
  
  {
      'saecki/crates.nvim',
      event = { "BufRead Cargo.toml" },
      config = function()
		require("crates").setup {
			lsp = {
				enabled = true,
				on_attach = function(client, bufnr)
					-- the same on_attach function as for your other lsp's
				end,
				actions = true,
				completion = true,
				hover = true,
			},
			text = {
				loading = "  Loading...",
				version = "  %s",
				prerelease = "  %s",
				yanked = "  %s yanked",
				nomatch = "  Not found",
				upgrade = "  %s",
				error = "  Error fetching crate",
			},
			popup = {
				text = {
					title = "# %s",
					pill_left = "",
					pill_right = "",
					created_label = "created        ",
					updated_label = "updated        ",
					downloads_label = "downloads      ",
					homepage_label = "homepage       ",
					repository_label = "repository     ",
					documentation_label = "documentation  ",
					crates_io_label = "crates.io      ",
					lib_rs_label = "lib.rs         ",
					categories_label = "categories     ",
					keywords_label = "keywords       ",
					version = "%s",
					prerelease = "%s pre-release",
					yanked = "%s yanked",
					enabled = "* s",
					transitive = "~ s",
					normal_dependencies_title = "  Dependencies",
					build_dependencies_title = "  Build dependencies",
					dev_dependencies_title = "  Dev dependencies",
					optional = "? %s",
					loading = " ...",
				},
			},
			completion = {
				text = {
					prerelease = " pre-release ",
					yanked = " yanked ",
				},
			},
		}
      end,
  },
  
  {
      'felpafel/inlay-hint.nvim',
      event = 'LspAttach',
      config = true,
  }
}

local opts = {}

require("lazy").setup(plugins, opts)

