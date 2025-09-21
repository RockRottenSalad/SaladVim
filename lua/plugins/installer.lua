local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- File explorer
Plug('stevearc/oil.nvim')

-- Colorscheme
Plug('vague2k/vague.nvim')

-- Allows wrapping selections with characters
Plug('tpope/vim-surround')
-- Allows .(repeat) command to work with vim-surround
Plug('tpope/vim-repeat')
-- (Un)comment with gcc
Plug('tpope/vim-commentary')

-- Auto pairs
Plug('jiangmiao/auto-pairs')

-- Continous LaTeX compilation, viewing and jump to location in PDF from vim
Plug('lervag/vimtex')

-- Snippets
Plug('sirver/ultisnips')

-- Allows removing an entry from the quickfix list using dd
Plug('TamaMcGlinn/quickfixdd')

-- Default configs for LSPs
Plug('neovim/nvim-lspconfig')

-- Fuzzy file search and grep
Plug('nvim-mini/mini.pick')

-- Better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = function()
    vim.cmd(":TSUpdate")
end})

vim.call('plug#end')

