-- ############
-- Basic Opt
-- ############
local f=vim.fn.isdirectory("/root/.local/share/nvim/site/pack/packer/start/nightfox.nvim")
if f~=0 then
	vim.cmd('colorscheme nightfox')
end

vim.cmd("set mouse=")

local o = vim.opt
local a = vim.api
o.number = true
o.hlsearch = true
o.tabstop = 2
o.softtabstop=2
o.shiftwidth=2
o.scrolloff=5
o.swapfile=false
o.encoding = "utf-8"
vim.wo.cursorline = true
o.wrapscan = false


-- ############
-- KeyMap Opt
-- ############
local set = vim.keymap.set
set('i', 'jj', '<ESC>')
set('n', 'J', '<C-d>')
set('n', 'K', '<C-u>')
set('n', 'mas', ':Mason<CR>')
set('n', 'sj', '<C-w>j')
set('n', 'sk', '<C-w>k')
set('n', 'sl', '<C-w>l')
set('n', 'sh', '<C-w>h')
set('n', 'qq', ':q<CR>')
set('n', 'Q', '<NOP>')
set('n', 'q', '<NOP>')
set('n', 'tn', ':tabn<CR>')
set('n', 'tp', ':tabp<CR>')
set('n', 'tw', ':w<CR>')
set('n', 'tq', ':q<CR>')
set('n', '<leader>q', ':q<CR>')
set('n', 'te', ':e!<CR>')
set('n', 'to', ':SymbolsOutline<CR>')
set('n', '<C-n>', ':NvimTreeToggle <CR>')
set('n', '<C-c>', ':nohl<CR>')
set('n', 'Rg', ':Rgrep<CR>')
set('i', '<C-f>', '<Right>')
set('t', '<ESC>', '<C-\\><C-n>')
set('t', 'jj', '<C-\\><C-n>')
set('n', '<C-g>', ':echo expand("%:p")<CR>')
set('n', '<C-q>', ':lclose<CR>')

