-- Set backgrounds for nvim-cmp
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#282828" })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#282828" })

-- Set color to copilot completion
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6cc644" })

return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        contrast = "hard",
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                --[[                
                palette_overrides = {
                    dark0_hard = "#000000",
                },
                ]]
                --
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                icons_enabled = true,
                theme = "auto",
                section_separators = { left = "", right = "" },
            },
        },
    },

    --[[
    {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = true,
    },

    { -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = "ibl",
        opts = {},
    },
    --]]
}
