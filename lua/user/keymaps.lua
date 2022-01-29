local utils = require "user.utils"

utils.map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

utils.map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
utils.map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

utils.map("i", "<C-p>", "<Up>")
utils.map("i", "<C-n>", "<Down>")
utils.map("i", "<C-b>", "<Left>")
utils.map("i", "<C-f>", "<Right>")
utils.map("i", "<C-a>", "<Home>")
utils.map("i", "<C-e>", "<End>")

utils.map("n", "<C-k>", "<C-w>k")
utils.map("n", "<C-j>", "<C-w>j")
utils.map("n", "<C-h>", "<C-w>h")
utils.map("n", "<C-l>", "<C-w>l")

utils.map({ "n", "v" }, "d", '"_d')
utils.map({ "v" }, "p", '"_dP')
