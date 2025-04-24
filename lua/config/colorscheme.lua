-- Read background from config variable
local theme_mode = 'dark'
local theme_config_file = io.open(vim.env.HOME..'/.config/theme.txt', 'r')

if theme_config_file then
	io.input(theme_config_file)
	theme_mode = io.read()
end

vim.opt.background = theme_mode
vim.cmd('colorscheme kanagawa-wave')
