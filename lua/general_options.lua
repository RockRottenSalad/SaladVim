local utils = require("utils")

vim.opt.encoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true
-- Cursor stays centered on big files
vim.opt.scrolloff = 999
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.opt.mouse = {}
vim.cmd("set backspace=2")

vim.cmd.colorscheme("vague")
vim.cmd("highlight Pmenu ctermbg=Grey ctermfg=White")
vim.cmd("highlight PmenuSel ctermbg=Blue ctermfg=Black")
vim.cmd("highlight FloatBorder ctermbg=White ctermfg=White")
vim.opt.winborder = "single"


utils.add_values(vim.opt.path, {"**"});
utils.add_values(vim.opt.wildignore, {"obj/**", "bin/**", "*.o"})


