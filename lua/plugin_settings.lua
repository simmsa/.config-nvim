-- Plugin Settings
-- Plugins are managed in lua/plugin_definitions.lua

--  dense-analysis/ale --------------------------------------------------{{{

vim.g.ale_completion_enabled = 0
vim.g.ale_disable_lsp = 'auto'
vim.g.ale_use_neovim_diagnostics_api = 1
vim.g.ale_fix_on_save = 1

vim.g.ale_fixers = {
    json = {'prettier'}
}

--  End dense-analysis/ale ----------------------------------------------}}}
--  lualine.nvim --------------------------------------------------------{{{

local function display_file_progress()
    return string.format('%s/%s', vim.fn.line('.'), vim.fn.line('$'))
end


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
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
    }
  },
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {
        {
          'diagnostics',

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { 'nvim_lsp', 'nvim_diagnostic', 'ale' },

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
        }
    },
    -- lualine_y = {'progress'},
    lualine_y = {{'filetype', icons_enabled = false}},
    -- lualine_z = {'location'}
    -- Disable bold text
    lualine_z = {
        {display_file_progress, color = {gui=''}
    }}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--  End lualine.nvim ----------------------------------------------------}}}
