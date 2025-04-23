return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind.nvim'
	},
	opts = {
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
		},
		formatting = {
			format = function(entry, item)
				local lspkind = require('lspkind')
				local runnable = lspkind.cmp_format({
					mode = "symbol_text",
					menu = ({
						buffer = "[buffer]",
						nvim_lsp = "[lsp]",
						luasnip = "[luasnip]",
						nvim_lua = "[lua]",
						latex_symbols = "[latex]",
					})
				})

				return runnable(entry, item)
			end
		},
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' }
		}
	}
}
