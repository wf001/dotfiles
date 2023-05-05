-- #############
-- fugitive
-- #############
local set = vim.keymap.set
set("n", "fs", ":Git<CR>")
set("n", "fb", ":Git blame<CR>")
set("n", "fd", ":Gvdiffsplit<CR>")
set("n", "fdf", ":G diff<CR>")
set("n", "fa", ":Git add .")
set("n", "fcm", ":Git commit<CR>")
set("n", "fl", ":!git log --oneline -n 5<CR>")
set("n", "fll", ":GlLog<CR>")

