local install_path = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
return {
    install = function()
	local repo_path = 'https://github.com/folke/lazy.nvim.git'

	local exist = (vim.uv or vim.loop).fs_stat(install_path)
	if not exist then
            local result = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repo_path, install_path })

	    if vim.v.shell_error ~= 0 then
	        vim.api.nvim_echo({ { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' }, { out, 'WarningMsg' }, { '\nPress any key to exit...' } }, true, {})
		vim.fn.getchar()
		os.exit(1)
	    end
        end
    end,

    bootstrap = function()
        vim.opt.rtp:prepend(install_path)

	require('lazy').setup({
	    spec = {{ import = 'plugins' }},
	    install = { colorscheme = { 'habamax' } },
	    checker = { enabled = true }
	})
    end
}
