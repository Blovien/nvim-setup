local au_filetypes = vim.api.nvim_create_augroup("ConfigFileType", { clear = true })

-- When commenting using command 'o' does not insert a comment leader
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    -- See https://github.com/LazyVim/LazyVim/issues/80
    { group = au_filetypes, pattern = { "*" }, command = "set fo-=o" }
)
