return {
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release'
}
