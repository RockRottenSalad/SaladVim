vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
})

vim.lsp.enable({
    "lua_ls",
    "gopls",
    "clangd",
    "texlab",
    "rust_analyzer",
    "ts_ls",
    "cssls",
    "csharp_ls",
    "zls",
    "jdtls",
    "hls",
--    "fsautocomplete",

    "pylsp",
    "ty",
    "ruff",
})


-- Disable LSP syntax hightlighing so it doesn't override treesitter
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

-- Only display in-line errors/warnings for the line the cursor is on
vim.diagnostic.config {
    virtual_text = { current_line = true, },
}
