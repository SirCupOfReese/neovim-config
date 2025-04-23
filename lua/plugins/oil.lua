return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = false,
	config = true,
	keys = {
		{ '<leader>fe', '<CMD>Oil<CR>', 'File explorer' }
	}
}
