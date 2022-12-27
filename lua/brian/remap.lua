local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Open netrw
keymap("n", "<leader>e", ":Ex <cr>", opts)

--Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

--Move vertical with d and u

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

--Move to center when searching

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

--Paste the same yanked line

keymap("x", "<leader>p", "\"_dP", opts)

--Yank to copy in pc clipboard 

keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

--Delete without copying

keymap("n", "<leader>d", "\"_d", opts)
keymap("v", "<leader>d", "\"_d", opts)

--Remap ESC in insert mode

keymap("i", "jk", "<Esc>", opts)

--Remap ESC in terminal 

keymap("t", "jk", "<C-\\><C-n>", opts)

--Change word 

keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Map for debugging

keymap("n", "<leader>ll", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>lo", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>li", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<leader>lu", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<Leader>lr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<Leader>la", ":lua require'dap'.run_last()<CR>", opts)
