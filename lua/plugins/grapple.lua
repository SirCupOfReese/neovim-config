return {
	'cbochs/grapple.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		{ 'nvim-tree/nvim-web-devicons', lazy = true }
	},
	config = function(opts)
		local grapple = require('grapple')
		local telescope = require('telescope')

		grapple.setup(opts)
		telescope.load_extension('grapple')
	end,
	keys = {
		{ '<leader>jt', function() require('grapple').toggle_tags() end, desc = 'Grapple tags' },
		{ '<leader>js', function() require('grapple').toggle_scopes() end, desc = 'Grapple scopes' },
		{ '<leader>ja', function() require('grapple').toggle() end, desc = 'Grapple tag location' },
		{ '<leader>ft', function() require('telescope').extensions.grapple.toggle_tags() end, desc = 'Find tags' },
		{ '<leader>fs', function() require('telescope').extensions.grapple.toggle_scopes() end, desc = 'Find scopes' }
	}
}
