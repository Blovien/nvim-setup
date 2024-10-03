local which_key = require("which-key")

local group_key = function(group, keys, func, desc_)
    vim.keymap.set("n", keys, func, { desc = group .. ": " .. desc_ })
end

local unique_key = function(keys, func, desc_)
    vim.keymap.set("n", keys, func, { desc = desc_ })
end

vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-h>", "<C-W>")
vim.keymap.set("n", "yil", "0y$", { desc = "Yank in Line" })

local builtin = require("telescope.builtin")
group_key("Telescope", "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

unique_key("<leader>e", "<cmd>Explore<CR>", "Open Default explorer")
unique_key("<leader>j", "<cmd>MoltenEvaluateVisual<CR>", "Evaluate current selection")
------------------------------------------------------------
--- SEARCH GROUP -------------------------------------------
------------------------------------------------------------
-- See `:help telescope.builtin`
group_key("Telescope", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
group_key("Telescope", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
group_key("Telescope", "<leader>sf", builtin.find_files, "[S]earch [F]iles")
group_key("Telescope", "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
group_key("Telescope", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
group_key("Telescope", "<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
group_key("Telescope", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
group_key("Telescope", "<leader>sr", builtin.resume, "[S]earch [R]esume")
group_key("Telescope", "<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')

group_key("Telescope", "<leader>s/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, "[S]earch [/] in Open Files")

group_key("Telescope", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "[S]earch [N]eovim files")

------------------------------------------------------------
--- REPLACE GROUP ------------------------------------------
------------------------------------------------------------

which_key.add({ "<leader>r", group = "[R]ename" })
group_key("Rename", "<leader>rf", ":%s//g<Left><Left>", "Replace in file")

------------------------------------------------------------
--- TOGGLE GROUP -------------------------------------------
------------------------------------------------------------

-- ToggleTerm
which_key.add({ "<leader>t", group = "[T]oggle" })
group_key("Toggle", "<leader>tt", "<cmd>ToggleTerm<CR>", "Terminal")

-- UndoTree
group_key("Toggle", "<leader>tu", "<cmd>UndotreeToggle<CR>", "UndoTree")

------------------------------------------------------------
-- HARPOON -------------------------------------------------
------------------------------------------------------------
which_key.add({ "<leader>h", group = "[H]arpoon" })

local harpoon = require("harpoon")
group_key("Harpoon", "<leader>ha", function()
    harpoon:list():add()
end, "Add to list")

group_key("Harpoon", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Toggle UI")

group_key("Harpoon", "<leader>h1", function()
    harpoon:list():select(1)
end, "Select 1")

group_key("Harpoon", "<leader>h1", function()
    harpoon:list():select(2)
end, "Select 2")

group_key("Harpoon", "<leader>h1", function()
    harpoon:list():select(3)
end, "Select 3")

group_key("Harpoon", "<leader>h1", function()
    harpoon:list():select(4)
end, "Select 4")

group_key("Harpoon", "<leader>hk", function()
    harpoon:list():prev()
end, "Previous")

group_key("Harpoon", "<leader>hj", function()
    harpoon:list():next()
end, "Next")
