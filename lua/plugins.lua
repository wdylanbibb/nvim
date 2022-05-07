-- File that contains all plugins.

local vim = vim

vim.cmd [[packadd packer.nvim]]
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- Normally this would go in configs but it has to do with sourcing and compiling plugins so it goes here
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

return require("packer").startup {
	function(use)
		-- Packer can manage itself
		use "wbthomason/packer.nvim"

		use {
			-- colorscheme I like :)
			"shaunsingh/nord.nvim"
		}

		use {
			-- displays possible key bindings
			"folke/which-key.nvim",
			config = [[ require('plugins/which-key') ]]
		}

		use {
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"BurntSushi/ripgrep",
				"fcying/telescope-ctags-outline.nvim",
				"nvim-telescope/telescope-ui-select.nvim"
			},
			config = [[ require('plugins/telescope') ]]
		}

		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

		use {
			"neovim/nvim-lspconfig",
			config = [[ require('plugins/lspconfig') ]]
		}

		use {
			"williamboman/nvim-lsp-installer",
			requires = {
				"neovim/nvim-lspconfig"
			},
			config = [[ require('plugins/lsp_installer_nvim') ]]
		}

		use {
			-- vscode-like pictograms for neovim lsp completion items Topics
			"onsails/lspkind-nvim",
			config = [[ require('plugins/lspkind') ]]
		}

		use {
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-vsnip",
				"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
				"hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
				"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
				"hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
				"hrsh7th/cmp-calc", -- nvim-cmp source for math calculation.
				"saadparwaiz1/cmp_luasnip" -- luasnip completion source for nvim-cmp
			},
			config = [[ require('plugins/cmp') ]]
		}

		use {
			"hrsh7th/vim-vsnip"
		}

		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				"windwp/nvim-ts-autotag",
				"p00f/nvim-ts-rainbow"
			},
			config = [[ require('plugins/treesitter') ]]
		}

		use {
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets"
			},
			config = [[ require('plugins/luasnip') ]]
		}

		use {
			"simrat39/rust-tools.nvim",
			config = [[ require('plugins/rust-tools') ]]
		}

		use {
			"tpope/vim-surround",
		}

		use {
			"tpope/vim-endwise"
		}

		use {
			"rstacruz/vim-closer"
		}

		use {
			"wellle/targets.vim"
		}

		use {
			"tpope/vim-fugitive"
		}

		use {
			"psliwka/vim-smoothie"
		}

		use {
			"rktjmp/highlight-current-n.nvim"
		}

		use {
			"numToStr/Comment.nvim",
			config = [[ require('plugins/Comment') ]]
		}

		use {
			"tanvirtin/vgit.nvim",
			requires = {
				"nvim-lua/plenary.nvim"
			},
			config = [[ require('plugins/vgit') ]]
		}

		use {
			"preservim/nerdtree",
			requires = {
				"Xuyuanp/nerdtree-git-plugin",
				"ryanoasis/vim-devicons"
			},
			config = [[ require('plugins/nerdtree') ]]
		}

		use {
			"nvim-lualine/lualine.nvim",
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = [[ require('plugins/lualine') ]]
		}

		use {
			"rcarriga/nvim-notify",
			config = [[ require('plugins/notify') ]]
		}

		use {
			"stevearc/dressing.nvim"
		}

		use {
			"max397574/better-escape.nvim"
		}

		-- use {
			-- "neoclide/coc.nvim",
			-- branch = "master",
			-- run = "yarn install --frozen-lockfile"
		-- }

		-- END OF PLUGINS --

		if packer_bootstrap then
		require("packer").sync()
		end
	end
}
