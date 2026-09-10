
-- SEE lua/plugins/oil_config.lua FOR OIL KEYBINDS
-- SEE ftplugin/tex.vim FOR TEX KEYBINDS AND VIMTEX LEADER

local utils = require 'utils'

-- Spacebar as leader
vim.g.mapleader = " "

-- Use Leader + w for pane control <C-w>
vim.keymap.set('n', '<leader>w', '<C-w>')

-- Oil
    -- Open Oil when å is pressed
vim.keymap.set('n', 'å', '<cmd>Oil<CR>')
    -- For non nordic keyboards
vim.keymap.set('n', '-', '<cmd>Oil<CR>')

-- Command window
vim.keymap.set('n', '<leader>q', 'q:')

-- Jump to mark with æ, ` sucks on nordic layout for frequently used key
vim.keymap.set('n', 'æ', '`')

-- Buffers
    -- Kills all buffers except the current one
vim.keymap.set('n', '<leader>kill', '<cmd>|%bd|e#|bd#<CR>|`"|<cmd>echo "Killed buffers"<CR>', { desc = "kill all buffers except current one" })
    -- Cycling through buffers
vim.keymap.set('n', '<leader>n', '<cmd>bnext<CR>', { desc = "goto next buffer" })
vim.keymap.set('n', '<leader>p', '<cmd>bprev<CR>', { desc = "goto prev buffer" })

vim.keymap.set('t', '<C-k>', '<C-\\><C-N>')

-- Quickfix list keybinds
    -- Open/Close quickfix list
vim.keymap.set('n', '<leader>co', '<cmd>copen<CR>')
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<CR>')
    -- Jump to next/prev quickfix list item
vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>')
    -- Add diagnostic errors to quickfix list
vim.keymap.set('n', '<leader>cd', '<cmd>lua vim.diagnostic.setqflist({ open = true })<CR>')

-- compile-mode keybinds
vim.keymap.set('n', '<leader>kk', '<cmd>Compile<CR>', { desc = "compile project" })
vim.keymap.set('n', '<leader>ll', '<cmd>Recompile<CR>', { desc = "recompile project" })
vim.keymap.set('n', '<C-j>', '<cmd>NextError<CR>', { desc = "goto next compilation error" })
vim.keymap.set('n', '<C-k>', '<cmd>PrevError<CR>', { desc = "goto prev compilation error" })

-- Re-source init.lua
vim.keymap.set('n', '<leader>S', '<cmd>source ~/.config/nvim/init.lua<CR><cmd>echo "Sourced init.lua"<CR>')

-- Kualala
--vim.keymap.set("n", "<leader>Rr", require('kulala').run, { desc = "Execute HTTP request" })
--vim.keymap.set("n", "<leader>Ra", require('kulala').run_all, { desc = "Execute all HTTP requests" })
--vim.keymap.set("n", "<leader>Ri", require('kulala').inspect, { desc = "Inspect HTTP request" })
--vim.keymap.set("n", "<leader>Rt", require('kulala').toggle_view, { desc = "Toggle response view" })

-- Repeat previous
    -- Repeat previous command
vim.keymap.set('n', '<leader>r', '@:')
    -- Edit previous file
vim.keymap.set('n', '<leader>s', ':e #<CR>')

-- Man page word under cursor
vim.keymap.set('n', '<leader>K', 'yiw:vertical Man <C-r>"<CR>')

-- Insert mode movement(should be default, but for some reason it isn't working)
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-h>', '<Left>')

-- Telescope plugin keybinds
local ts = require('telescope.builtin')
local themes = require('telescope.themes')
vim.keymap.set('n', '<leader>ff', ts.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ts.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', ts.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', ts.help_tags, { desc = 'Telescope help tags' })

-- Indent and de-indent from insert mode
vim.keymap.set('i', '<C-f>', '<C-o>>>')
vim.keymap.set('i', '<C-d>', '<C-o><<')

-- LSP keybinds
    -- Format file
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'LSP reformat file' })
    -- Jump to def/dec
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, desc = "goto declaration" })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "goto definition" })
    -- Trigger LSP omnicompletion
vim.keymap.set("i", "<C-space>", '<C-x><C-o>')
    -- Trigger LSP code action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
    -- Trigger LSP code rename
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "code rename" })

-- goto next error/warn(diagnostic)
vim.keymap.set("n", "<C-f>", vim.diagnostic.goto_next, { desc = "goto next diagnositic" })
vim.keymap.set("n", "<C-s>", vim.diagnostic.goto_prev, { desc = "goto prev diagnostic" })

-- Args
vim.keymap.set('n', '<leader>al', '<cmd>args<CR>', { desc = "list args" })
vim.keymap.set('n', '<leader>ae', '<cmd>last<CR><cmd>args<CR>', { desc = "goto last arg file" })
vim.keymap.set('n', '<leader>ac', '<cmd>argdelete *<CR><cmd>echo "Cleared args"<CR>', { desc = "clear args" })
vim.keymap.set('n', '<leader>ad', '<cmd>argdelete %<CR><cmd>args<CR>', { desc = "remove buffer from args" })
vim.keymap.set('n', '<leader>an', '<cmd>next<CR><cmd>args<CR>', { desc = "goto next arg file" })
vim.keymap.set('n', '<leader>ap', '<cmd>prev<CR><cmd>args<CR>', { desc = "goto prev arg file" })
vim.keymap.set('n', '<leader>aa',
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
, { desc = "add buffer to args" })
vim.keymap.set('n', '<leader>ag',
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
, { desc = "number + this to goto nth arg" })

