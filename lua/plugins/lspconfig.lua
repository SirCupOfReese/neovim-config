return {
	'neovim/nvim-lspconfig',
	dependencies = { 'williamboman/mason-lspconfig.nvim' },
	config = function()
		require('mason-lspconfig').setup_handlers {
			function(server)
				require('lspconfig')[server].setup({})
			end
		}
	end
}
