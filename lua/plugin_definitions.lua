-- Plugin Definitions
-- Plugin Settings/Configuration in lua/plugin_settings.lua

-- Plugin Manager (lazy.nvim) Setup ------------------------------------------------{{{

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

--  End Plugin Manager (lazy.nvim) Setup --------------------------------------------}}}
--  Plugin List --------------------------------------------------------{{{

local local_plugin_dir = "~/.config/nvim/bundle/"

require("lazy").setup({
	"tpope/vim-commentary",
	"mattn/emmet-vim",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	-- 'vim-airline/vim-airline',
	"jiangmiao/auto-pairs",
	"justinmk/vim-sneak",
	"airblade/vim-gitgutter",
	"tpope/vim-repeat",
	"airblade/vim-gitgutter",
	"terryma/vim-expand-region",
	"tpope/vim-rsi",
	"tpope/vim-abolish",
	"airblade/vim-rooter",
	"vim-scripts/CmdlineComplete",
	"junegunn/fzf",
	"junegunn/fzf.vim",
	"junegunn/vim-easy-align",
	"norcalli/nvim-colorizer.lua",
	-- 'lervag/vimtex',
	"dense-analysis/ale",
	"vim-pandoc/vim-pandoc",
	"vim-pandoc/vim-pandoc-syntax",
	-- 'tpope/vim-markdown',
	"quarto-dev/quarto-vim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	"godlygeek/tabular",
	"preservim/vim-markdown",
	-- 'hrsh7th/vim-vsnip-integ',
	-- 'saadparwaiz1/cmp_luasnip',
	-- 'L3MON4D3/LuaSnip',
	-- 'sirVer/ultisnips',
	-- 'quangnguyen30192/cmp-nvim-ultisnips',
	-- { 'KeitaNakamura/tex-conceal.vim',  ft = { "tex", "quarto" } },
	-- 'github/copilot.vim',
	"hiphish/rainbow-delimiters.nvim",
	"quarto-dev/quarto-nvim",
	"jmbuhr/otter.nvim",
	"simmsa/innerblock",
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- {'neoclide/coc.nvim', branch = 'release'},
	{ "nvim-treesitter/nvim-treesitter" },
	{
		dir = local_plugin_dir .. "sustain",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme sustain]])
		end,
	},
	{
		dir = local_plugin_dir .. "fzf-mru",
	},
	{
		dir = local_plugin_dir .. "google",
	},
})

--  End Plugin List ----------------------------------------------------}}}
