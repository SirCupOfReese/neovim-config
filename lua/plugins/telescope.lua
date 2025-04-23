return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>ff', require('telescope/builtin').find_files, desc = 'Find files (gitignore enabled)' },
		{ '<leader>fg', require('telescope/builtin').git_files, desc = 'Find git (gitignore enabled)' },
		{ '<leader>fs', require('telescope/builtin').live_grep, desc = 'Live text search (gitignore enabled)' },
		{ '<leader>fp', require('telescope/builtin').builtin, desc = 'Pick a picker' },
		{ '<leader>fb', require('telescope/builtin').buffers, desc = 'Find buffer' },
		{ '<leader>fc', require('telescope/builtin').command_history, desc = 'Find recent command' }
	}
}
