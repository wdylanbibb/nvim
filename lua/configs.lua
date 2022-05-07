local vim = vim -- reduce lsp errors
local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

cmd('autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey') -- to Show whitespace, MUST be inserted BEFORE the colorscheme command
vim.g.nord_disable_background = true
vim.g.nord_contrast = true
vim.g.nord_borders = true
require('nord').set()

set.wrap = false -- don't automatically wrap on load
set.number = true -- show line numbers
set.relativenumber = true -- show relative line numbers
set.cursorline = true -- highlight current line
set.autoindent = true -- maintain intent from current line on new line
set.tabstop = 4 -- spaces per tab
set.shiftwidth = 4
set.smarttab = true
set.softtabstop = 4
set.mouse = "a"
set.splitbelow = true
set.splitright = true

set.list = false

-- highlight on yank
exec([[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
	augroup end
]], false)


