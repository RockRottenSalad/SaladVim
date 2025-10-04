
-- SEE lua/plugins/oil_config.lua FOR OIL KEYBINDS
-- SEE ftplugin/tex.vim FOR TEX KEYBINDS AND VIMTEX LEADER

local utils = require 'utils'

-- Spacebar as leader
vim.g.mapleader = " "

-- Use Leader + w for pane control <C-w>
vim.keymap.set('n', '<Leader>w', '<C-w>')

-- Oil
    -- Open Oil when å is pressed
vim.keymap.set('n', 'å', '<cmd>Oil<CR>')
    -- For non nordic keyboards
vim.keymap.set('n', '-', '<cmd>Oil<CR>')

-- Command window
vim.keymap.set('n', '<Leader>q', 'q:')

-- Jump to mark with æ, ` sucks on nordic layout for frequently used key
vim.keymap.set('n', 'æ', '`')

-- Buffers
    -- Kills all buffers except the current one
vim.keymap.set('n', '<Leader>kill', '<cmd>|%bd|e#|bd#<CR>|`"|<cmd>echo "Killed buffers"<CR>')
    -- Cycling through buffers
vim.keymap.set('n', '<Leader>n', '<cmd>bnext<CR>')
vim.keymap.set('n', '<Leader>p', '<cmd>bprev<CR>')

-- Quickfix list keybinds
    -- Open/Close quickfix list
vim.keymap.set('n', '<Leader>co', '<cmd>copen<CR>')
vim.keymap.set('n', '<Leader>cc', '<cmd>cclose<CR>')
    -- Jump to next/prev quickfix list item
vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>')
    -- Add diagnostic errors to quickfix list
vim.keymap.set('n', '<Leader>cd', '<cmd>vim.diagnostic.setqflist({ open = true })<CR>')

-- Re-source init.lua
vim.keymap.set('n', '<Leader>S', '<cmd>source ~/.config/nvim/init.lua<CR><cmd>echo "Sourced init.lua"<CR>')

-- Repeat previous
    -- Repeat previous command
vim.keymap.set('n', '<Leader>r', '@:')
    -- Edit previous file
vim.keymap.set('n', '<Leader>s', ':e #<CR>')

-- Insert mode movement(should be default, but for some reason it isn't working)
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-h>', '<Left>')

-- Mini pick plugin keybinds
vim.keymap.set('n', '<Leader>ff', ':Pick files<CR>')
vim.keymap.set('n', '<Leader>fh', ':Pick help<CR>')
vim.keymap.set('n', '<Leader>fg', ':Pick grep<CR>')
vim.keymap.set('n', '<Leader>fb', ':Pick buffers<CR>')

-- Indent and de-indent from insert mode
vim.keymap.set('i', '<C-f>', '<C-o>>>')
vim.keymap.set('i', '<C-d>', '<C-o><<')

-- LSP keybinds
    -- Format file
vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.format)
    -- Jump to def/dec
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
    -- Trigger LSP omnicompletion
vim.keymap.set("i", "<C-space>", '<C-x><C-o>')

-- Args
vim.keymap.set('n', '<Leader>al', '<cmd>args<CR>')
vim.keymap.set('n', '<Leader>ae', '<cmd>last<CR><cmd>args<CR>')
vim.keymap.set('n', '<Leader>ac', '<cmd>argdelete *<CR><cmd>echo "Cleared args"<CR>')
vim.keymap.set('n', '<Leader>ad', '<cmd>argdelete %<CR><cmd>args<CR>')
vim.keymap.set('n', '<Leader>an', '<cmd>next<CR><cmd>args<CR>')
vim.keymap.set('n', '<Leader>ap', '<cmd>prev<CR><cmd>args<CR>')
vim.keymap.set('n', '<Leader>aa',
    function()
        local cur_file = vim.fn.expand('%')

        local argv = vim.fn.argv()
        if utils.contains(argv, cur_file) then
            vim.cmd('args')
            return
        end

        vim.cmd("+"..tostring(vim.v.count).."argadd %")
        vim.cmd('args')
    end
)
vim.keymap.set('n', '<Leader>ag',
    function()
        local argc = vim.fn.argc()

        if argc == 0 then
            vim.cmd('args')
            return
        end

        if vim.v.count == 0 then
            vim.cmd('rewind')
        elseif vim.v.count >= 1 and vim.v.count <= argc then
            vim.cmd('rewind')
            vim.cmd(tostring(vim.v.count)..'next')
        end
        vim.cmd('args')
    end
)

