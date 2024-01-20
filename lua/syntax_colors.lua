-- The colorscheme is specified in the lazyvim setup in ./plugins.lua
-- vim.cmd.colorscheme("sustain")

vim.opt.syntax = "on"

vim.g["sustain#code#brightness"] = 5
vim.g["sustain#code#contrast"] = 1
-- vim.g['sustain#code#contrast'] = 0
vim.g["sustain#ui#brightness"] = 5
vim.g["sustain#ui#contrast"] = 2
vim.g["sustain#link_colors"] = 1
vim.g["sustain#enable_maps"] = 0

-- Highlight current line
vim.opt.cursorline = true

-- sign define numhl=SignColumn
vim.fn.sign_define({ { numhl = "SignColumn" } })
