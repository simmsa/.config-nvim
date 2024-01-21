local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--  Tabs and Spaces -----------------------------------------------------{{{

local shift_width = 4

-- Use spaces instead of tabs
vim.opt.expandtab = true
-- 1 tab == 4 spaces
vim.opt.shiftwidth = shift_width
vim.opt.tabstop = shift_width
vim.opt.softtabstop = shift_width

--  End Tabs and Spaces -------------------------------------------------}}}
--  Misc Options -------------------------------------------------------{{{

-- Wrap lines that are too wide for the current window
vim.opt.wrap = true
-- Shift wrapped lines by shift_width number of characters
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:" .. shift_width
-- Wrap long lines at a character in 'breakat' rather than the last character that fits on the screen.
-- Only affects the way the file is displayed, not its contents.
vim.opt.linebreak = true
-- Enables automatic C program indenting
vim.opt.cindent = true
-- Allow buffers to be put in the 'background' without saving them
vim.opt.hidden = true
-- Don't show current mode down the bottom, airline does this better
vim.opt.showmode = false
-- Display tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ",
	trail = "⋅",
	nbsp = "⋅",
	extends = "",
	precedes = "",
}
-- No redraws in macros
vim.opt.lazyredraw = true
-- Turn off parentheses matching, it's driving me crazy
vim.g.loaded_matchparen = 1
-- Toggle from relative numbering to regular numbering in normal/insert
vim.opt.relativenumber = true
vim.opt.number = true

augroup("LineNumToggle", { clear = true })

autocmd("InsertEnter", {
	group = "LineNumToggle",
	pattern = "*",
	command = "set norelativenumber number",
})

autocmd("InsertLeave", {
	group = "LineNumToggle",
	pattern = "*",
	command = "set relativenumber",
})

-- Fixing Delays
vim.opt.ttimeoutlen = 10
vim.opt.timeoutlen = 400
vim.opt.updatetime = 100

-- Better tab completion in the command line
vim.opt.wildmode = { "longest", "list", "full" }

-- Ignore files
vim.opt.wildignore = {
	"*/.git/*",
	"*/.ipynb_checkpoints/*",
	"*/.jpg",
	"*/.png",
	"*/.gif",
}

-- Set dictionary
vim.o.dictionary = "/usr/share/dict/words"

-- Set spell language
vim.o.spelllang = "en_us"

-- Use zsh if available
local zsh_path = vim.fn.systemlist("which zsh")[1]
if not vim.fn.empty(zsh_path) then
	vim.o.shell = zsh_path
end

-- Make test_name auto completable
-- vim.bo.iskeyword = vim.bo.iskeyword .. '_'
-- vim.o.iskeyword = vim.o.iskeyword .. '_'

-- Don't highlight really long lines
vim.o.synmaxcol = 500

-- Use gui colors in the terminal
vim.o.termguicolors = true
vim.g.terminal_scrollback_buffer_size = 100000

-- Prefer splits to open below and on the right
vim.o.splitbelow = true
vim.o.splitright = true

-- Avoid loading vimballPlugin and rrhelper
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.did_install_default_menus = 1

-- Disable preview for completion
vim.o.completeopt = vim.o.completeopt:gsub("preview,", "")

-- Open diffs + fugitive vertically
vim.opt.diffopt:append({ "vertical" })

-- Set fillchars for vertical splits
vim.o.fillchars = "vert:│"

-- Set guicursor
vim.o.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Set Python host program
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

-- Allow setting terminal window name from vim via titlestring
vim.o.title = true

-- Enable backup
vim.o.backup = true
vim.o.swapfile = false

-- Set undodir, backupdir, and swapfile dir
vim.o.undodir = vim.fn.expand("~/.local/share/nvim/undo//")
vim.o.backupdir = vim.fn.expand("~/.local/share/nvim/backup//")
vim.o.directory = vim.fn.expand("~/.local/share/nvim/swap//")

local function createDirectoryIfNotExists(input_dir)
	local complete_input_directory = vim.fn.expand(input_dir)
	if type(complete_input_directory) == "string" then
		if not vim.fn.isdirectory(complete_input_directory) then
			vim.fn.mkdir(complete_input_directory, "p")
		end
	end
end

createDirectoryIfNotExists(vim.o.undodir)
createDirectoryIfNotExists(vim.o.backupdir)
createDirectoryIfNotExists(vim.o.directory)

-- Default plus save 1000 previously edited, used to make v:oldfiles more
-- useful for custom mru plugin
vim.o.shada = "!,'1000,<50,s10,h"

--  End Misc Options ---------------------------------------------------}}}
