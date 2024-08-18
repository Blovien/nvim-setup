return {
    {
        "folke/noice.nvim",
        opts = {
            routes = {
                -- remove code_action spam in mini view
                {
                    view = "mini",
                    filter = { event = "lsp", kind = "progress", find = "code_action" },
                    opts = { skip = true },
                },
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = { render = "minimal", top_down = false, background_colour = "#1d2021" },
    },
}
