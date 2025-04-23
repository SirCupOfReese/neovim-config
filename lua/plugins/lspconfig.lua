return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp'
	},
	config = function()
		require('mason-lspconfig').setup_handlers {
			function(server)
				local lspconfig = require('lspconfig')
				local server = lspconfig[server]
				local cmp = require('cmp_nvim_lsp')
				local capabilities = cmp.default_capabilities()
				
				server.setup({ capabilities = capabilities })
			end
		}
	end
}
