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

		-- nord: colorscheme I like
		use {
			"shaunsingh/nord.nvim"
		}

		-- whick-key: displays possible key bindings
		use {
			"folke/which-key.nvim",
			config = [[ require('plugins/which-key') ]]
		}

		-- telescope: Fuzzy finder
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

		-- telescope-fzf-native: Telescope plugin for fzf
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

		-- nvim-lspconfig: Configuration for language server
		use {
			"neovim/nvim-lspconfig",
			config = [[ require('plugins/lspconfig') ]]
		}

		-- nvim-lsp-installer: Installer for language servers
		use {
			"williamboman/nvim-lsp-installer",
			requires = {
				"neovim/nvim-lspconfig"
			},
			config = [[ require('plugins/lsp_installer_nvim') ]]
		}

		-- lspkind-nvim: vscode-like pictograms for neovim lsp completion items Topics
		use {
			"onsails/lspkind-nvim",
			config = [[ require('plugins/lspkind') ]]
		}

		-- nvim-cmp: Code Completion for neovim (plus plugins)
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

		-- vim-vsnip: VSCode(LSP)'s snippet feature
		use {
			"hrsh7th/vim-vsnip"
		}

		-- nvim-treesitter: Parser tool (highlighting, folding, indents)
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				"windwp/nvim-ts-autotag",
				"p00f/nvim-ts-rainbow"
			},
			config = [[ require('plugins/treesitter') ]]
		}

		-- LuaSnip: snippet engine
		use {
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets"
			},
			config = [[ require('plugins/luasnip') ]]
		}

		-- rust-tools.nvim: Utilities for Rust (using rust-analyzer)
		use {
			"simrat39/rust-tools.nvim",
			config = [[ require('plugins/rust-tools') ]]
		}

		-- vim-surround: Helpful commands for surrounding text objects
		use {
			"tpope/vim-surround",
		}

		-- vim-endwise: Ends certain structures automatically
		use {
			"tpope/vim-endwise"
		}

		-- vim-closer: Closes parentheses, brackets, etc.
		use {
			"rstacruz/vim-closer"
		}

		-- targets.vim: Provides additional text targets for vim
		use {
			"wellle/targets.vim"
		}

		-- vim-fugitive: Vim Git integration
		use {
			"tpope/vim-fugitive"
		}

		-- vim-smoothie: Smooth scrolling
		use {
			"psliwka/vim-smoothie"
		}

		-- highlight-current-n.nvim: Highlights the current term being searched in a buffer
		use {
			"rktjmp/highlight-current-n.nvim"
		}

		-- Commend.nvim: allows for commenting via command
		use {
			"numToStr/Comment.nvim",
			config = [[ require('plugins/Comment') ]]
		}

		-- vgit.nvim: Visual git integration
		use {
			"tanvirtin/vgit.nvim",
			requires = {
				"nvim-lua/plenary.nvim"
			},
			config = [[ require('plugins/vgit') ]]
		}

		-- NERDTree: File tree (with some git integration for showing added, deleted, or changed files)
		use {
			"preservim/nerdtree",
			requires = {
				"Xuyuanp/nerdtree-git-plugin",
				"ryanoasis/vim-devicons"
			},
			config = [[ require('plugins/nerdtree') ]]
		}

		-- lualine.nvim: Fast and simple statusline
		use {
			"nvim-lualine/lualine.nvim",
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = [[ require('plugins/lualine') ]]
		}

		-- nvim-notify: Fancy notifications
		use {
			"rcarriga/nvim-notify",
			config = [[ require('plugins/notify') ]]
		}

		-- dressing.nvim: Changes vim.ui interfaces
		use {
			"stevearc/dressing.nvim"
		}

		-- better-escape.nvim: Allows for escaping insert mode quicker
		use {
			"max397574/better-escape.nvim",
			config = function()
				require("better_escape").setup()
			end
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
