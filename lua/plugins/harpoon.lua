local configure_harpoon = function()
	local harpoon = require('harpoon')
	harpoon:setup()
end

local create_harpoon_picker = function()
	local function telescope(files)
		local paths = {}
		for _, item in ipairs(files.items) do 
			table.insert(paths, item.value)
		end

		local pickers = require('telescope/pickers')
		local finders = require('telescope/finders')

		local config = require('telescope/config').values
		pickers.new({}, {
			prompt_title = 'Harpoon',
			finder = finders.new_table({
				results = paths
			}),
			previewer = config.file_previewer({}),
			sorter = config.generic_sorter({})
		}):find()
	end

	local picker = function()
		local harpoon = require('harpoon')

		telescope(harpoon:list())
	end

	return picker
end

return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim'
	},
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup({})
	end,
	keys = {
		{ '<leader>fh', create_harpoon_picker(), desc = 'Find Harpooned files' },
		{ '<leader>ha', function() require('harpoon'):list():add() end, desc = 'Harpoon current file' },
		{ '<leader>hh', function() require('harpoon/ui'):toggle_quick_menu(require('harpoon'):list()) end, desc = 'Open Harpoon menu' },
		{ '<leader>hn', function() require('harpoon'):list():next() end, desc = 'Go to next Harpooned file' },
		{ '<leader>hp', function() require('harpoon'):list():prev() end, desc = 'Go to previous Harpooned file' },
		{ '<leader>h1', function() require('harpoon'):list():select(1) end, desc = 'Open Harpooned file #1' },
		{ '<leader>h2', function() require('harpoon'):list():select(2) end, desc = 'Open Harpooned file #2' },
		{ '<leader>h3', function() require('harpoon'):list():select(3) end, desc = 'Open Harpooned file #3' },
		{ '<leader>h4', function() require('harpoon'):list():select(4) end, desc = 'Open Harpooned file #4' },
		{ '<leader>h5', function() require('harpoon'):list():select(5) end, desc = 'Open Harpooned file #5' },
		{ '<leader>h6', function() require('harpoon'):list():select(6) end, desc = 'Open Harpooned file #6' },
		{ '<leader>h7', function() require('harpoon'):list():select(7) end, desc = 'Open Harpooned file #7' },
		{ '<leader>h8', function() require('harpoon'):list():select(8) end, desc = 'Open Harpooned file #8' },
		{ '<leader>h9', function() require('harpoon'):list():select(9) end, desc = 'Open Harpooned file #9' }
	}
}
