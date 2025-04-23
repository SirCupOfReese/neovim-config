local lazy = require('config/lazy')

lazy.install()
vim.g.mapleader = " "
lazy.bootstrap()

require('config/user')
require('config/colorscheme')
