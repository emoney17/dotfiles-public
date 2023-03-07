-- Base
vim.o.signcolumn = 'yes'
vim.o.nu = true
vim.o.relativenumber = false
vim.o.termguicolors = true
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

-- Plugins

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'm4xshen/autoclose.nvim'
    use 'numToStr/Comment.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'rose-pine/neovim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
    }
end)

-- Colors Config
require('rose-pine').setup({
	variant = 'auto',
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = true,

	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},

	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
	}
})
vim.cmd('colorscheme rose-pine')

-- Treesitter Config
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "cpp", "bash" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- LSP Config
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
  'clangd',
})
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
lsp.setup()
vim.diagnostic.config({
    virtual_text = true
})

-- Requires
require("autoclose").setup()
require('Comment').setup()
require('colorizer').setup()
-- vim.cmd('colorscheme tokyonight')
