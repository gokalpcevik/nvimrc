vim.g.mapleader = " "
-- Save with Left CTRL + S
vim.keymap.set("n", "<C-s>", vim.cmd.w)
-- Add a new line below in normal mode with <Enter>
vim.keymap.set("n", "<Enter>", "o<ESC>")

