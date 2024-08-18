return {
    "mbbill/undotree",
    config = function()
        -- Optional: Set up keybindings or other configurations
        -- for
        -- check if platform is windows
        if vim.fn.has("win32") == 1 then
            vim.g.undotree_DiffCommand = "FC"
        end
    end,
}
