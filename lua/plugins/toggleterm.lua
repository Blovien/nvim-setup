return {
    "akinsho/nvim-toggleterm.lua",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = false,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "single",
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
    end,
}
