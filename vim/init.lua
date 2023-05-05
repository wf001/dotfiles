require('common.basic')
require('common.local')

vim.lsp.set_log_level('trace')

-- ############
-- Plugins
-- ############
require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	-- use 'scrooloose/nerdtree'
	use 'nvim-tree/nvim-tree.lua'
	use 'cohama/lexima.vim'
	use 'tpope/vim-surround'
	use 'vim-scripts/grep.vim'
	use 'tpope/vim-fugitive'
	-- use 'preservim/tagbar'
	--use {
  --    'stevearc/aerial.nvim',
	--		config = function() require('aerial').setup() end
	--	}
	use 'simrat39/symbols-outline.nvim'

	--use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	--	require("toggleterm").setup()
	--end}
	use 'voldikss/vim-floaterm'

	use 'nvim-treesitter/nvim-treesitter'
	use 'simeji/winresizer'
	use {
		"EdenEast/nightfox.nvim",
		commit = "e2f961859cbfb2ba38147dc59fdd2314992c8b62"
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true
		}
	}
	use 'nvim-tree/nvim-web-devicons'
	use 'nanozuki/tabby.nvim'
	use 'norcalli/nvim-colorizer.lua'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'j-hui/fidget.nvim'

	-- Clojure
	use {
		'liuchengxu/vim-clap',
		tag = "v0.42"
	}
	use 'guns/vim-sexp'
	use 'liquidz/vim-iced'
	use {
		'dense-analysis/ale'
	}

	-- ts, vue
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'nvim-lua/plenary.nvim'

	-- fuzzy find
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep'
		}
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


	-- Lua
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use { 'm-demare/hlargs.nvim' }

end)





-- ############
-- Plugins Opt
-- ############
require('plugins.ale')
-- require('plugins.aerial')
require('plugins.fidget')
require('plugins.furgitive')
require('plugins.floaterm')
require('plugins.nvim-tree')
require('plugins.rgrep')
require('plugins.symbols-outline')
-- require('plugins.tagbar')
require('plugins.telescope')
-- require('plugins.toggleterm')
require('plugins.treesitter')

-- May raise error unless place it here.
require('common.lsp')
require('lang.clojure')
require('lang.php')
require('common.ui')
