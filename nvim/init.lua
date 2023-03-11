-- Base
vim.o.nu = true
vim.o.relativenumber = false
vim.o.termguicolors = false
vim.o.scrolloff = 8
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = false
vim.o.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.o.cursorline = false
-- vim.opt.colorcolumn = "80"
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Keybinds

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>.', '<CMD>Ex<CR>')
map('n', '<leader>wv', '<CMD>vsplit<CR>')
map('n', '<leader>ws', '<CMD>split<CR>')
map('n', '<leader>ww', '<C-W><C-W>')
map('n', '<leader>wc', '<C-W><C-C>')
map('n', '<leader>bn', '<CMD>bnext<CR>')
map('n', '<leader>bk', '<CMD>bw<CR>')
map('n', '<leader>bi', '<CMD>buffers<CR>')
map('n', '<C-c>', '<CMD>:nohlsearch<CR>')
map('n', '<leader>ot', '<CMD>below split | size 10 | startinsert | term<CR>')
map('t', '<Esc>', '<C-\\><C-n>')
