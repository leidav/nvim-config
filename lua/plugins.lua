return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'williamboman/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'Mofiqul/vscode.nvim'
	use { 'akinsho/bufferline.nvim', tags = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use 'nvim-telescope/telescope-fzy-native.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'ray-x/lsp_signature.nvim'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use { 'akinsho/toggleterm.nvim', tags = 'v1.*' }
	use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
	-- use 'Pocco81/DAPInstall.nvim'
	-- use 'Shatur/neovim-cmake'
	use { 'tami5/lspsaga.nvim' }
	use 'onsails/lspkind-nvim'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'lukas-reineke/indent-blankline.nvim', tag = "v2.20.8" }
	use 'folke/neodev.nvim'
end)
