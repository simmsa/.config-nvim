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
local plugin_manager = require("lazy")

plugin_manager.setup({
	"tpope/vim-commentary",
	"mattn/emmet-vim",
	"tpope/vim-fugitive",
	{ "junegunn/gv.vim", dependencies = { "tpope/vim-fugitive" } },
	"tpope/vim-surround",
	"jiangmiao/auto-pairs",
	"justinmk/vim-sneak",
	"tpope/vim-repeat",
	"lewis6991/gitsigns.nvim",
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
	{
		"robitx/gp.nvim",
		config = function()
			local conf = {
				-- For customization, refer to Install > Configuration in the Documentation/Readme
			}
			require("gp").setup(conf)

			-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
		end,
	},
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
}, {
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
})

--  End Plugin List ----------------------------------------------------}}}
