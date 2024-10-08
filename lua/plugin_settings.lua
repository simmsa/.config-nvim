-- Plugin Settings
-- Plugins are defined in lua/plugin_definitions.lua

--  dense-analysis/ale --------------------------------------------------{{{

vim.g.ale_completion_enabled = 0
vim.g.ale_disable_lsp = "auto"
vim.g.ale_use_neovim_diagnostics_api = 1
vim.g.ale_fix_on_save = 1

vim.g.ale_fixers = {
	json = { "prettier" },
	lua = { "stylua" },
	python = { "ruff", "black" },
	r = { "formatR" },
}

--  End dense-analysis/ale ----------------------------------------------}}}
--  lualine.nvim --------------------------------------------------------{{{

local function display_file_progress()
	return string.format("%s/%s", vim.fn.line("."), vim.fn.line("$"))
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode", "searchcount" },
		-- lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_b = { "branch", "diff" },
		lualine_c = { "filename" },
		-- lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_x = {
			{
				"diagnostics",

				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				sources = { "nvim_lsp", "nvim_diagnostic", "ale" },

				-- Displays diagnostics for the defined severity types
				-- sections = { 'error', 'warn', 'info', 'hint' },

				-- diagnostics_color = {
				--   -- Same values as the general color option can be used here.
				--   error = 'DiagnosticError', -- Changes diagnostics' error color.
				--   warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
				--   info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
				--   hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
				-- },
				-- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
				-- colored = true,           -- Displays diagnostics status in color if set to true.
				-- update_in_insert = false, -- Update diagnostics in insert mode.
				-- always_visible = true,   -- Show diagnostics even if there are none.
			},
		},
		-- lualine_y = {'progress'},
		lualine_y = { { "filetype", icons_enabled = false } },
		-- lualine_z = {'location'}
		-- Disable bold text
		lualine_z = {
			{ display_file_progress, color = { gui = "" } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				show_filename_only = true, -- Shows shortened relative path when set to false.
				hide_filename_extension = false, -- Hide filename extension when set to true.
				show_modified_status = true, -- Shows indicator when the buffer is modified.

				mode = 2, -- 0: Shows buffer name
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				-- 3: Shows buffer number
				-- 4: Shows buffer name + buffer number

				max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- it can also be a function that returns
				-- the value of `max_length` dynamically.
				filetype_names = {
					TelescopePrompt = "Telescope",
					dashboard = "Dashboard",
					packer = "Packer",
					fzf = "FZF",
					alpha = "Alpha",
				}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

				-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
				use_mode_colors = false,

				buffers_color = {
					-- Same values as the general color option can be used here.
					active = "lualine_a_normal", -- Color for active buffer.
					inactive = "lualine_b_normal", -- Color for inactive buffer.
				},

				symbols = {
					modified = " ●", -- Text to show when the buffer is modified
					alternate_file = "", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
				-- show_filename_only = true,
				-- hide_filename_extension = true,
				-- show_modified_status = true,
				-- buffers_color = { active = "lualine_a_normal", inactive = "lualine_b_normal" },
				-- buffers_color = { active = "lualine_normal_a", inactive = "lualine_inactive_a" },
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

--  End lualine.nvim ----------------------------------------------------}}}
--  gitsigns.nvim -------------------------------------------------------{{{

require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		-- map('n', ']c', function()
		--   if vim.wo.diff then
		--     vim.cmd.normal({']c', bang = true})
		--   else
		--     gitsigns.nav_hunk('next')
		--   end
		-- end)

		-- map('n', '[c', function()
		--   if vim.wo.diff then
		--     vim.cmd.normal({'[c', bang = true})
		--   else
		--     gitsigns.nav_hunk('prev')
		--   end
		-- end)

		-- Actions
		-- map('n', '<leader>hs', gitsigns.stage_hunk)
		-- map("n", "cn", gitsigns.nav_hunk("next"))
		map("n", "cn", function()
			gitsigns.nav_hunk("next")
		end)
		map("n", "sh", gitsigns.stage_hunk)
		map("n", "su", gitsigns.undo_stage_hunk)
		-- map('n', '<leader>hr', gitsigns.reset_hunk)
		-- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
		-- map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
		-- map('n', '<leader>hS', gitsigns.stage_buffer)
		-- map('n', '<leader>hu', gitsigns.undo_stage_hunk)
		-- map('n', '<leader>hR', gitsigns.reset_buffer)
		-- map('n', '<leader>hp', gitsigns.preview_hunk)
		-- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
		-- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
		-- map('n', '<leader>hd', gitsigns.diffthis)
		-- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
		-- map('n', '<leader>td', gitsigns.toggle_deleted)

		-- Text object
		-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

--  End gitsigns.nvim ---------------------------------------------------}}}
--  quarto-nvim ---------------------------------------------------------{{{

require("quarto").setup({
	debug = false,
	closePreviewOnExit = true,
	lspFeatures = {
		enabled = true,
		languages = { "r", "python", "bash" },
		chunks = "curly", -- 'curly' or 'all'
		diagnostics = {
			enabled = true,
			triggers = { "BufWritePost" },
		},
		completion = {
			enabled = true,
		},
	},
	codeRunner = {
		enabled = false,
		default_method = nil, -- 'molten' or 'slime'
		ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
		-- Takes precedence over `default_method`
		never_run = { "yaml" }, -- filetypes which are never sent to a code runner
	},
	keymap = {
		hover = "M",
		definition = "gd",
		-- rename = '<leader>lR',
		references = "gr",
	},
})

--  End quarto-nvim -----------------------------------------------------}}}
--  otter.nvim ----------------------------------------------------------{{{

local otter = require("otter")
otter.setup({
	lsp = {
		hover = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	buffers = {
		-- if set to true, the filetype of the otterbuffers will be set.
		-- otherwise only the autocommand of lspconfig that attaches
		-- the language server will be executed without setting the filetype
		set_filetype = false,
		-- write <path>.otter.<embedded language extension> files
		-- to disk on save of main buffer.
		-- usefule for some linters that require actual files
		-- otter files are deleted on quit or main buffer close
		write_to_disk = true,
	},
	strip_wrapping_quote_characters = { "'", '"', "`" },
})

local otter_languages = { "python", "r" }
local otter_completion = true
local otter_diagnostics = true
local otter_use_treesitter = true

otter.activate(otter_languages, otter_completion, otter_diagnostics, otter_use_treesitter)

--  End otter.nvim ------------------------------------------------------}}}
--  nvim-treesitter -----------------------------------------------------{{{

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"r",
		"python",
		"markdown",
		"markdown_inline",
		"bash",
		"yaml",
		"lua",
		"vim",
		"query",
		"vimdoc",
		"latex",
		"html",
		"css",
		"dot",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "markdown" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

vim.g.ts_highlight_lua = true

--  End nvim-treesitter -------------------------------------------------}}}
--  jackMort/ChatGPT.nvim -----------------------------------------------{{{

local defaults = {
	api_key_cmd = nil,
	yank_register = "+",
	edit_with_instructions = {
		diff = false,
		keymaps = {
			close = "<C-c>",
			accept = "<C-y>",
			toggle_diff = "<C-d>",
			toggle_settings = "<C-o>",
			toggle_help = "<C-h>",
			cycle_windows = "<Tab>",
			use_output_as_input = "<C-i>",
		},
	},
	chat = {
		welcome_message = "Test",
		loading_text = "Loading, please wait ...",
		question_sign = "", -- 🙂
		answer_sign = "ﮧ", -- 🤖
		border_left_sign = "",
		border_right_sign = "",
		max_line_length = 120,
		sessions_window = {
			active_sign = "  ",
			inactive_sign = "  ",
			current_line_sign = "",
			border = {
				style = "rounded",
				text = {
					top = " Sessions ",
				},
			},
			win_options = {
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},
		keymaps = {
			close = "<C-c>",
			yank_last = "<C-y>",
			yank_last_code = "<C-k>",
			scroll_up = "<C-u>",
			scroll_down = "<C-d>",
			new_session = "<C-n>",
			cycle_windows = "<Tab>",
			cycle_modes = "<C-f>",
			next_message = "<C-j>",
			prev_message = "<C-k>",
			select_session = "<Space>",
			rename_session = "r",
			delete_session = "d",
			draft_message = "<C-r>",
			edit_message = "e",
			delete_message = "d",
			toggle_settings = "<C-o>",
			toggle_sessions = "<C-p>",
			toggle_help = "<C-h>",
			toggle_message_role = "<C-r>",
			toggle_system_role_open = "<C-s>",
			stop_generating = "<C-x>",
		},
	},
	popup_layout = {
		default = "center",
		center = {
			width = "80%",
			height = "80%",
		},
		right = {
			width = "30%",
			width_settings_open = "50%",
		},
	},
	popup_window = {
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top = " ChatGPT ",
			},
		},
		win_options = {
			wrap = true,
			linebreak = true,
			foldcolumn = "1",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		buf_options = {
			filetype = "markdown",
		},
	},
	system_window = {
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top = " SYSTEM ",
			},
		},
		win_options = {
			wrap = true,
			linebreak = true,
			foldcolumn = "2",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	popup_input = {
		prompt = "  ",
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top_align = "center",
				top = " Prompt ",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		submit = "<C-Enter>",
		submit_n = "<Enter>",
		max_visible_lines = 20,
	},
	settings_window = {
		setting_sign = "  ",
		border = {
			style = "rounded",
			text = {
				top = " Settings ",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	help_window = {
		setting_sign = "  ",
		border = {
			style = "rounded",
			text = {
				top = " Help ",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	openai_params = {
		model = "gpt-3.5-turbo",
		frequency_penalty = 0,
		presence_penalty = 0,
		max_tokens = 300,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
	openai_edit_params = {
		model = "gpt-3.5-turbo",
		frequency_penalty = 0,
		presence_penalty = 0,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
	use_openai_functions_for_edits = false,
	actions_paths = {},
	show_quickfixes_cmd = "Trouble quickfix",
	predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
	highlights = {
		help_key = "@symbol",
		help_description = "@comment",
	},
}

require("chatgpt").setup({
	actions_paths = { "/Users/asmacbook/.config/nvim/chatgpt_actions/custom_actions.json" },
	config = defaults,
})

--  End jackMort/ChatGPT.nvim -------------------------------------------}}}
--  hphish/rainbow-delimiters.nvim --------------------------------------{{{

-- This module contains a number of default definitions
local rainbow_delimiters = require("rainbow-delimiters")

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		commonlisp = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	priority = {
		[""] = 110,
		lua = 210,
	},
	highlight = {
		"RainbowOne",
		"RainbowTwo",
		"RainbowThree",
		"RainbowFour",
		"RainbowFive",
		"RainbowSix",
		"RainbowSeven",
		"RainbowEight",
	},
	-- blacklist = {'c', 'cpp'},
}

--  End hphish/rainbow-delimiters.nvim ----------------------------------}}}
--  nvim-cmp Autocomplete -----------------------------------------------{{{

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- From: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings for vim-vsnip
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn['UtliSnips#Anon'](args.body)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	completion = {
		keyword_length = 1,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		-- From: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings for vim-vsnip
		["<Tab>"] = cmp.mapping(function(fallback)
			local entries = cmp.get_entries()
			local entry_count = #entries
			local first_entry_type = nil

			if entry_count > 0 then
				local completion_item = entries[1]["completion_item"]
				if completion_item and completion_item["data"] and completion_item["data"]["snippet"] then
					first_entry_type = "snippet"
				end
			end

			if entry_count == 1 or first_entry_type == "snippet" then
				cmp.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				})
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "buffer" },
		{ name = "otter" },
		{
			name = "path",
			option = {
				trailing_slash = true,
				label_trailing_slash = true,
			},
		},
	}),
})

vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"

--  End nvim-cmp Autocomplete -------------------------------------------}}}
--  LSP (nvim-lspconfig) Setup -----------------------------------------------------------{{{

local lspconfig = require("lspconfig")

-- nvim-lspconfig recommended setup
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "M", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<space>f', function()
		--     vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
	"pyright",
	"vale_ls",
	"terraformls",
	"r_language_server",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

--  Neovim Lua LSP Setup -----------------------------------------------{{{

require("lspconfig").lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
})

--  End Neovim Lua LSP Setup -------------------------------------------}}}

--  End LSP (nvim-lspconfig) Setup -------------------------------------------------------}}}
