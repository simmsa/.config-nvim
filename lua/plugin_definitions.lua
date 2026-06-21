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
    -- "mattn/emmet-vim",
    "tpope/vim-fugitive",
    { "junegunn/gv.vim",                dependencies = { "tpope/vim-fugitive" } },
    "tpope/vim-surround",
    "jiangmiao/auto-pairs",
    "justinmk/vim-sneak",
    "tpope/vim-repeat",
    "lewis6991/gitsigns.nvim",
    "terryma/vim-expand-region",
    "tpope/vim-rsi",
    -- "tpope/vim-abolish",
    "airblade/vim-rooter",
    "vim-scripts/CmdlineComplete",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "junegunn/vim-easy-align",
    -- "dense-analysis/ale",
    "vim-pandoc/vim-pandoc",
    "vim-pandoc/vim-pandoc-syntax",
    -- { "neovim/nvim-lspconfig", dependencies = { "nvimdev/lspsaga.nvim" } },
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "godlygeek/tabular",
    -- "preservim/vim-markdown",
    -- "derekstride/tree-sitter-sql",
    "quarto-dev/quarto-nvim",
    "jmbuhr/otter.nvim",
    "simmsa/innerblock",
    "stevearc/oil.nvim",
    -- 'mfussenegger/nvim-dap',
    -- "David-Kunz/gen.nvim",
    -- {
    --     "folke/trouble.nvim",
    --     opts = {
    --         -- auto_open = true,
    --         -- auto_close = true,
    --         -- modes = {
    --         --     diagnostics = {
    --         --         auto_close = true,
    --         --         auto_open = true,
    --         --     }
    --         -- }
    --         -- modes {
    --         --     diagnostics {
    --         --         auto_close = true,
    --         --         auto_open = true,
    --         --     }
    --         -- }
    --     }, -- for default options, refer to the configuration section for custom setup.
    --     cmd = "Trouble",
    --     keys = {
    --         {
    --             "<leader>xx",
    --             "<cmd>Trouble diagnostics toggle<cr>",
    --             desc = "Diagnostics (Trouble)",
    --         },
    --         {
    --             "qq",
    --             "<cmd>Trouble diagnostics toggle<cr>",
    --             desc = "Diagnostics (Trouble)",
    --         },
    --         {
    --             "<leader>xX",
    --             "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --             desc = "Buffer Diagnostics (Trouble)",
    --         },
    --         {
    --             "<leader>cs",
    --             "<cmd>Trouble symbols toggle focus=false<cr>",
    --             desc = "Symbols (Trouble)",
    --         },
    --         {
    --             "<leader>cl",
    --             "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --             desc = "LSP Definitions / references / ... (Trouble)",
    --         },
    --         {
    --             "<leader>xL",
    --             "<cmd>Trouble loclist toggle<cr>",
    --             desc = "Location List (Trouble)",
    --         },
    --         {
    --             "<leader>xQ",
    --             "<cmd>Trouble qflist toggle<cr>",
    --             desc = "Quickfix List (Trouble)",
    --         },
    --     },
    -- },
    {
        "folke/trouble.nvim",
        opts = {
            modes = {
                diagnostics = {
                    win = { position = "right" },
                    auto_open = false, -- Set to true if you want it to open automatically
                    auto_close = false,
                },
            },
            keys = {
                M = "preview", -- Show diagnostic preview on M
            },
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "qq",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    -- {
    -- 	"folke/which-key.nvim",
    -- 	event = "VeryLazy",
    -- 	opts = {
    -- 		-- your configuration comes here
    -- 		-- or leave it empty to use the default settings
    -- 		-- refer to the configuration section below
    -- 	},
    -- 	keys = {
    -- 		{
    -- 			"<leader>?",
    -- 			function()
    -- 				require("which-key").show({ global = false })
    -- 			end,
    -- 			desc = "Buffer Local Keymaps (which-key)",
    -- 		},
    -- 	},
    -- },
    -- {
    --     "mrcjkb/rustaceanvim",
    --     version = "^6", -- Recommended
    --     lazy = false,   -- This plugin is already lazy
    -- },
    { "nvim-lualine/lualine.nvim",      dependencies = { "nvim-tree/nvim-web-devicons" } },
    -- {
    -- 	"nvimdev/lspsaga.nvim",
    -- 	config = function()
    -- 		require("lspsaga").setup({ lightbulb = { enable = false } })
    -- 	end,
    -- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    -- },
    -- {
    -- 	"jackMort/ChatGPT.nvim",
    -- 	dependencies = {
    -- 		"MunifTanjim/nui.nvim",
    -- 		"nvim-lua/plenary.nvim",
    -- 		"nvim-telescope/telescope.nvim",
    -- 	},
    -- },
    { "nvim-treesitter/nvim-treesitter" },
    -- { "greggh/claude-code.nvim",        dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
            { "cc", "<cmd>ClaudeCode --continue<cr>", desc = "Claude Code --continue" },
            { "CC", "<cmd>ClaudeCode<cr>",            desc = "Claude Code" },
            { "cy", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Claude Code Accept Diff (Yes)" },
            { "cx", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Claude Code Deny Diff (No), x" },
            -- {
            --     "<leader>as",
            --     "<cmd>ClaudeCodeTreeAdd<cr>",
            --     desc = "Add file",
            --     ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
            -- },
        },
    },
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
    {
        dir = local_plugin_dir .. "quarto-folding",
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
