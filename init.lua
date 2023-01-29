if not vim.g.vscode then
	require("neodev").setup({})
	require('plugins')
	require('utils')
	require('lsp')
	require('lualine').setup({ options = { theme = 'vscode' } })

	require('nvim-treesitter.configs').setup({
		ensure_installed = {
			'c', 'cpp', 'python', 'rust', 'lua', 'typescript', 'make', 'json',
			'yaml', 'javascript', 'bash', 'cmake', 'html', 'css', 'dockerfile',
			'glsl', 'toml', 'vim', 'tsx'
		},
		highlight = { enable = true, additional_vim_regex_highlighting = false }
	})

	vim.opt.termguicolors = true
	vim.g.vscode_style = 'dark'
	vim.cmd('colorscheme vscode')

	require('bufferline').setup({})

	require('telescope').setup({
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true
			}
		}
	})
	require('telescope').load_extension('fzy_native')

	require('nvim-tree').setup({})

	require('toggleterm').setup({})

	require('auto-session').setup({
		log_level = 'error',
		auto_session_enabled = true,
		auto_session_suppress_dirs = {
			'~/', '~/projects', '~/Documents/projects'
		}
	})
	require('nvim-web-devicons').setup({})

	require('diffview').setup({ enhanced_diff_hl = false, use_icons = true })

	require('indent_blankline').setup({})



	vim.o.sessionoptions =
	'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'


	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.signcolumn = 'yes'
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 0
	vim.opt.shiftwidth = 4
	vim.opt.smartindent = true
	vim.opt.cindent = true
	vim.opt.cinoptions = '(0,u0,U0'

	vim.opt.colorcolumn = '80'

	-- enable mouse in all modes exept insert mode
	vim.opt.mouse = 'nvchr'

	-- better copy and paste
	vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'

	vim.opt.completeopt = 'menuone'

	vim.g.mapleader = ','

	vim.opt.cursorline = true
	vim.opt.termguicolors = true
	vim.opt.background = 'dark'
	vim.opt.laststatus = 3
	if vim.g.neovide then
		vim.opt.guifont = 'Source Code Pro:h11'
		vim.g.neovide_cursor_animation_length = 0.05
		vim.g.neovide_cursor_vfx_mode = 'ripple'
		vim.g.terminal_color_0 = '#0000'
		vim.g.terminal_color_1 = '#CC0000'
		vim.g.terminal_color_2 = '#4E9A06'
		vim.g.terminal_color_3 = '#C4A000'
		vim.g.terminal_color_4 = '#3465A4'
		vim.g.terminal_color_5 = '#75507B'
		vim.g.terminal_color_6 = '#06989A'
		vim.g.terminal_color_7 = '#D3D7CF'
		vim.g.terminal_color_8 = '#555753'
		vim.g.terminal_color_9 = '#EF2929'
		vim.g.terminal_color_10 = '#8AE234'
		vim.g.terminal_color_11 = ' #FCE94F'
		vim.g.terminal_color_12 = '#729FCF'
		vim.g.terminal_color_13 = '#AD7FA8'
		vim.g.terminal_color_14 = '#34E2E2'
		vim.g.terminal_color_15 = '#EEEEEC'
	end

	-- switch z and y on german keyboard
	noremap('<C-z>', '<C-y>')

	-- disable left mouse click in normal mode
	-- nmap('<LeftMouse>', '')

	-- resize window
	nnoremap('+', '<C-W>+')
	nnoremap('-', '<C-W>-')
	nnoremap('_', '<C-W><')
	nnoremap('*', '<C-W>>')

	-- fast window switching
	nnoremap('<C-h>', '<C-w>h')
	nnoremap('<C-j>', '<C-w>j')
	nnoremap('<C-k>', '<C-w>k')
	nnoremap('<C-l>', '<C-w>l')

	-- open terminal
	noremap('<Leader>t', ':ToggleTerm<CR>')

	-- fast terminal exit
	tnoremap('<ESC>', '<C-\\><C-n>')
	tnoremap('<C-h>', '<C-\\><C-n><C-w>h')
	tnoremap('<C-j>', '<C-\\><C-n><C-w>j')
	tnoremap('<C-k>', '<C-\\><C-n><C-w>k')
	tnoremap('<C-l>', '<C-\\><C-n><C-w>l')

	-- fuzzy search
	nnoremap('<C-p>', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]])
	-- split and search
	nnoremap('<Leader>s',
		[[<C-W>s<C-W>j<Cmd>lua require('telescope.builtin').find_files()<CR>]])
	nnoremap('<Leader>v',
		[[<C-W>v<C-W>l<Cmd>lua require('telescope.builtin').find_files()<CR>]])

	noremap('<C-n>', ':NvimTreeToggle<CR>')
	-- go to buffer
	nnoremap('gb', ':BufferLinePick<CR>')
	nnoremap('gl', ':BufferLineCycleNext<CR>')
	nnoremap('gh', ':BufferLineCyclePrev<CR>')

	-- close buffer
	-- nnoremap('<C-c>', ':BufferLinePickClose<CR>')
	nnoremap('<C-c>', ':bd<CR>')

	require('dapconfig')
end
