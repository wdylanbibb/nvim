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

exec([[
	augroup TreeStart
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
		autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
		autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
	augroup end
]], false)

exec([[
	augroup TreeClose
		" Exit Vim if NERDTree is the only window remaining in the only tab.
		autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
		" Close the tab if NERDTree is the only window remaining in it.
		autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
		" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
		autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
	augroup end
]], false)

