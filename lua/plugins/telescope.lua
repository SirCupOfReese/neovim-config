return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzf-native.nvim'
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case'
			}
		}
	},
	config = function(opts)
		local telescope = require('telescope')
		telescope.setup(opts)
		telescope.load_extension('fzf')
	end,
	keys = {
		{ '<leader>ff', function() require('telescope/builtin').find_files() end, desc = 'Find files (gitignore enabled)' },
		{ '<leader>fg', function() require('telescope/builtin').git_files() end, desc = 'Find git (gitignore enabled)' },
		{ '<leader>fl', function() require('telescope/builtin').live_grep() end, desc = 'Find live text (gitignore enabled)' },
		{ '<leader>fp', function() require('telescope/builtin').builtin() end, desc = 'Pick a picker' },
		{ '<leader>fb', function() require('telescope/builtin').buffers() end, desc = 'Find buffer' },
		{ '<leader>fc', function() require('telescope/builtin').command_history() end, desc = 'Find recent command' }
	}
}
