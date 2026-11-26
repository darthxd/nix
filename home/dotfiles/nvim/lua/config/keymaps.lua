vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Salvar e sair rapidamente
keymap("n", "<leader>w", ":w<CR>", { desc = "Salvar arquivo", silent = true })
keymap("n", "<leader>q", ":q<CR>", { desc = "Sair", silent = true })

-- Navegação entre splits com Ctrl + h/j/k/l
keymap("n", "<C-h>", "<C-w>h", { desc = "Janela da esquerda", silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Janela de baixo", silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Janela de cima", silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Janela da direita", silent = true })

-- Manter seleção ao recuar texto no modo visual
keymap("v", "<", "<gv", { silent = true })
keymap("v", ">", ">gv")

keymap("n", "<leader>a", "ggVG", { silent = true })

keymap("n", "<Esc>", ":nohlsearch<CR>", { silent = true })
