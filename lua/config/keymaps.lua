local which_key = require("which-key")
local builtin = require("telescope.builtin")

local map_group = function(group, keys, func, desc_)
    vim.keymap.set("n", keys, func, { desc = group .. ": " .. desc_ })
end

local map = function(keys, func, desc_)
    vim.keymap.set("n", keys, func, { desc = desc_ })
end

map_group("Telescope", "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

-- open file_browser with the path of the current buffer
map(
    "<leader>e",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    "Open Telescope file browser in current directory"
)

--------------------------------------------------------------------------------
--- SEARCH GROUP ---------------------------------------------------------------
--------------------------------------------------------------------------------

which_key.add({ "<leader>s", group = "[S]earch" })

map_group("Telescope", "<leader>sh", builtin.help_tags, "[H]elp")
map_group("Telescope", "<leader>sk", builtin.keymaps, "[K]eymaps")
map_group("Telescope", "<leader>sf", builtin.find_files, "[F]iles")
map_group("Telescope", "<leader>ss", builtin.builtin, "[S]elect Telescope")
map_group("Telescope", "<leader>sw", builtin.grep_string, "Current [W]ord")
map_group("Telescope", "<leader>sg", builtin.live_grep, "by [G]rep")
map_group("Telescope", "<leader>sd", builtin.diagnostics, "[D]iagnostics")
map_group("Telescope", "<leader>sr", builtin.resume, "[R]esume")

map_group("Telescope", "<leader>s/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, "[/] in Open Files")

map_group("Telescope", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "[N]eovim files")

--------------------------------------------------------------------------------
--- REPLACE GROUP --------------------------------------------------------------
--------------------------------------------------------------------------------

which_key.add({ "<leader>r", group = "[R]eplace" })

map_group("Rename", "<leader>rf", ":%s//g<Left><Left>", "Replace in file")

--------------------------------------------------------------------------------
--- TOGGLE GROUP ---------------------------------------------------------------
--------------------------------------------------------------------------------

which_key.add({ "<leader>t", group = "[T]oggle" })

map_group("Toggle", "<leader>tu", "<cmd>UndotreeToggle<CR>", "UndoTree")
map_group("Toggle", "<Leader>tl", require("lsp_lines").toggle, "Lsp lines")

--------------------------------------------------------------------------------
