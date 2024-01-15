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
