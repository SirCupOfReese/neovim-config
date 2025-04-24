local tab = function(key)
	local cmp = require('cmp')
	local luasnip = require('luasnip')

	if cmp.visible() then
		local entry = cmp.get_selected_entry()

		if not entry then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			return
		end

		if luasnip.expandable() then
			luasnip.expand()
			return
		else
			cmp.confirm()
			return
		end
	elseif luasnip.locally_jumpable(1) then
		luasnip.jump(1)
		return
	end
    local escaped_key = vim.api.nvim_replace_termcodes(key, true, false, true)
	vim.api.nvim_feedkeys(escaped_key, 'n', true)
end

local up = function(key)
	local cmp = require('cmp')

	if cmp.visible() then
		local entry = cmp.get_selected_entry()

		if entry then
			cmp.select_prev_item()
			return
		end
	end

	vim.api.nvim_feedkeys(key, 'n', true)
end

local down = function(key)
	local cmp = require('cmp')

	if cmp.visible() then
		local entry = cmp.get_selected_entry()

		if entry then
			cmp.select_next_item()
			return
		end
	end

	vim.api.nvim_feedkeys(key, 'n', true)
end

local enter = function(key)
	local cmp = require('cmp')

	if cmp.visible() then
		local entry = cmp.get_selected_entry()

		if entry then
			if luasnip.expandable() then
				luasnip.expand()
				return
			else
				cmp.confirm()
				return
			end
		end
	end

	vim.api.nvim_feedkeys(key, 'n', true)
end

return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind.nvim'
	},
	keys = {
		{ '<Tab>', function() tab('<Tab>') end, desc = 'Autocomplete tab', mode = { 'i' } },
		{ '<CR>', function() enter('<CR>') end, desc = 'Autocomplete enter', mode = { 'i' } },
		{ 'j', function() down('j') end, desc = 'Autocomplete next', mode = { 'i' } },
		{ 'k', function() up('k') end, desc = 'Autocomplete previous', mode = { 'i' } }
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
