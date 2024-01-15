local set_keymap = vim.api.nvim_set_keymap

local function normal_remap(from, to)
    set_keymap('n', from, to, {silent = true, noremap = true, nowait = true})
end

local function normal_map(from, to)
    set_keymap('n', from, to, {silent = true, nowait = true})
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- vim.api.nvim_set_keymap('v', '<Leader>ce', chatgpt.edit_with_instructions, {})
-- vim.keymap.set('v', '<leader>ce', chatgpt.edit_with_instructions)
vim.keymap.set('n', 'gb', function() print("real lua function") end)
-- I have to explicitly set space to use leader

-- vim.keymap.set('v', '<space>ce', chatgpt.edit_with_instructions)
-- vim.keymap.set('v', '<Leader>ce', chatgpt.edit_with_instructions)

-- Dvorak Setup
-- Basic Movements
-- h -> Down
-- t -> Up
-- n -> Right
-- d -> Left

-- vim.api.nvim_set_keymap('n', 'd', '<Left>', { silent = true , noremap = true})
-- nnoremap <silent> d <Left>
normal_remap('d', '<Left>')

-- nnoremap <silent> n <Right>
-- vim.api.nvim_set_keymap('n', 'n', '<Right>', { silent = true })
normal_remap('n', '<Right>')

-- nnoremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
-- vim.api.nvim_set_keymap('n', 'h', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- nnoremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
-- vim.api.nvim_set_keymap('n', 't', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

-- xnoremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
-- vim.api.nvim_set_keymap('x', 'h', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- xnoremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
-- vim.api.nvim_set_keymap('x', 't', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

-- xnoremap d <Left>
-- vim.api.nvim_set_keymap('x', 'd', '<Left>', { silent = true })
-- xnoremap n <Right>
-- vim.api.nvim_set_keymap('x', 'n', '<Right>', { silent = true })

-- Quicker Movement
-- vim.api.nvim_set_keymap('n', 'D', '^', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'N', 'g_', {noremap = true})
-- vim.api.nvim_set_keymap('x', 'D', '^', {noremap = true})
-- vim.api.nvim_set_keymap('x', 'N', 'g_', {noremap = true})

-- j is now jump, swapping with t
-- vim.api.nvim_set_keymap('n', 'j', 't', {noremap = true})
-- k is now kill swapping with d
-- vim.api.nvim_set_keymap('n', 'k', 'd', {noremap = true})
-- vim.api.nvim_set_keymap('x', 'k', 'd', {noremap = true})
-- l is now look up next swapping with n
-- vim.api.nvim_set_keymap('n', 'l', ':normal! nzz<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', 'L', ':normal! Nzz<CR>', { silent = true })
-- Consistent behavior with C
-- vim.api.nvim_set_keymap('n', 'K', 'd$', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})
-- easier navigation of finds
-- vim.api.nvim_set_keymap('n', '-', ':', {noremap = true})
-- Faster Movements (lookUps)
-- u -> f mapped with vim-sneak
-- I Fudged up
-- vim.api.nvim_set_keymap('n', 'f', 'u', {noremap = true})

-- vim.api.nvim_set_keymap('x', 'n', '<Right>', {noremap = true})


-- nnoremap <silent> d <Left>
-- vim.api.nvim_set_keymap('n', 'd', '<Left>', { silent = true })
-- -- nnoremap <silent> n <Right>
-- vim.api.nvim_set_keymap('n', 'n', '<Right>', { silent = true })

-- -- nnoremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
-- vim.api.nvim_set_keymap('n', 'h', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- -- nnoremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
-- vim.api.nvim_set_keymap('n', 't', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

-- -- xnoremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
-- vim.api.nvim_set_keymap('x', 'h', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- -- xnoremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
-- vim.api.nvim_set_keymap('x', 't', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

-- -- xnoremap d <Left>
-- vim.api.nvim_set_keymap('x', 'd', '<Left>', { silent = true })
-- -- xnoremap n <Right>
-- vim.api.nvim_set_keymap('x', 'n', '<Right>', { silent = true })


-- Quicker Movement
-- set_keymap('n', 'D', '^', { silent = true })
-- set_keymap('n', 'N', 'g_', { silent = true })
-- set_keymap('x', 'D', '^', { silent = true })
-- set_keymap('x', 'N', 'g_', { silent = true })

-- -- j is now jump, swapping with t
-- set_keymap('n', 'j', 't', { silent = true })
-- -- k is now kill swapping with d
-- set_keymap('n', 'k', 'd',  {silent = true })
-- -- l is now look up next swapping with n
-- set_keymap('n', 'l', ':normal! nzz<CR>', { silent = true })
-- set_keymap('n', 'L', ':normal! Nzz<CR>', { silent = true })
-- -- Consistent behavior with C
-- set_keymap('n', 'K', ':normal! d$<CR>', {silent = true})
-- set_keymap('n', 'Y', 'y$', {silent = true})
-- -- easier navigation of finds
-- set_keymap('n', '-', ':', {silent = true})
-- -- Faster Movements (lookUps)
-- -- u -> f mapped with vim-sneak
-- -- I Fudged up
-- set_keymap('n', 'f', ':normal! u<CR>', {silent = true})

-- set_keymap('x', 'n', '<Right>', {silent = true})

-- test

