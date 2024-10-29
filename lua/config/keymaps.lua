local which_key = require("which-key")

local map_group = function(group, keys, func, desc_)
    vim.keymap.set("n", keys, func, { desc = group .. ": " .. desc_ })
end

local map = function(keys, func, desc_)
    vim.keymap.set("n", keys, func, { desc = desc_ })
end

vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-h>", "<C-W>")
vim.keymap.set("n", "yil", "0y$", { desc = "Yank in Line" })

local builtin = require("telescope.builtin")
map_group("Telescope", "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

map("<leader>e", "<cmd>Explore<CR>", "Open Default explorer")

------------------------------------------------------------
--- SEARCH GROUP -------------------------------------------
------------------------------------------------------------

which_key.add({ "<leader>s", group = "[S]earch" })

-- See `:help telescope.builtin`
map_group("Telescope", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
map_group("Telescope", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
map_group("Telescope", "<leader>sf", builtin.find_files, "[S]earch [F]iles")
map_group("Telescope", "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
map_group("Telescope", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
map_group("Telescope", "<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
map_group("Telescope", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
map_group("Telescope", "<leader>sr", builtin.resume, "[S]earch [R]esume")
map_group("Telescope", "<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')

map_group("Telescope", "<leader>s/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, "[S]earch [/] in Open Files")

map_group("Telescope", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "[S]earch [N]eovim files")

------------------------------------------------------------
--- REPLACE GROUP ------------------------------------------
------------------------------------------------------------

which_key.add({ "<leader>r", group = "[R]eplace" })

map_group("Rename", "<leader>rf", ":%s//g<Left><Left>", "Replace in file")

------------------------------------------------------------
--- TOGGLE GROUP -------------------------------------------
------------------------------------------------------------

which_key.add({ "<leader>t", group = "[T]oggle" })

-- ToggleTerm
which_key.add({ "<leader>t", group = "[T]oggle" })
map_group("Toggle", "<leader>tt", "<cmd>ToggleTerm<CR>", "Terminal")

-- UndoTree
map_group("Toggle", "<leader>tu", "<cmd>UndotreeToggle<CR>", "UndoTree")

------------------------------------------------------------
--- HARPOON -------------------------------------------------
------------------------------------------------------------
which_key.add({ "<leader>h", group = "[H]arpoon" })

local harpoon = require("harpoon")
map_group("Harpoon", "<leader>ha", function()
    harpoon:list():add()
end, "Add to list")

map_group("Harpoon", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Toggle UI")

map_group("Harpoon", "<leader>h1", function()
    harpoon:list():select(1)
end, "Select 1")

map_group("Harpoon", "<leader>h1", function()
    harpoon:list():select(2)
end, "Select 2")

map_group("Harpoon", "<leader>h1", function()
    harpoon:list():select(3)
end, "Select 3")

map_group("Harpoon", "<leader>h1", function()
    harpoon:list():select(4)
end, "Select 4")

map_group("Harpoon", "<leader>hk", function()
    harpoon:list():prev()
end, "Previous")

map_group("Harpoon", "<leader>hj", function()
    harpoon:list():next()
end, "Next")
