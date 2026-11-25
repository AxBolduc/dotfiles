-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set
-- Remap lazy
map("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Maps for leetcode
map("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "Leet run" })
map("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "Leet submit" })
map("n", "<leader>ll", "<cmd>Leet list<CR>", { desc = "Leet list" })
map("n", "<leader>ld", "<cmd>Leet daily<CR>", { desc = "Leet daily" })
map("n", "<leader>lo", "<cmd>Leet open<CR>", { desc = "Leet open" })

map("n", "<leader>mc", "<cmd>make<CR>", { desc = "Make Compile" })
map("n", "<leader>mr", "<cmd>make run<CR>", { desc = "Make Run" })
map("n", "<leader>mC", "<cmd>make clean<CR>", { desc = "Make Clean" })
