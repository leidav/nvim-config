if (not vim.g.vscode) then
    require('plugins')
    require('utils')
    require('lsp')
    require('lualine').setup({options = {theme = 'vscode'}})

    require('nvim-treesitter.configs').setup({
        ensure_installed = "maintained",
        highlight = {enable = true, additional_vim_regex_highlighting = false}
    })

    vim.g.vscode_style = "dark"
    vim.cmd('colorscheme vscode')

    vim.opt.termguicolors = true
    require("bufferline").setup {}

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

    require("toggleterm").setup({})

    require('auto-session').setup({
        log_level = 'info',
        auto_session_enabled = true,
        auto_session_suppress_dirs = {
            '~/', '~/projects', '~/Documents/projects'
        }
    })
    vim.o.sessionoptions =
        "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

    -- local dap_install = require("dap-install")
    -- dap_install.setup({})

    -- local debuggers = require("dap-install.api.debuggers").get_installed_debuggers()

    -- for _, debugger in ipairs(debuggers) do
    --	dap_install.config(debugger)
    -- end

    -- require('cmake').setup({})
    -- require('telescope').load_extension('cmake')

    -- require('cmake').setup({
    -- dap_configuration = {
    -- type = 'codelldb',
    -- request = 'launch',
    -- stopOnEntry = false,
    -- runInTerminal = false,
    -- }
    -- })
    vim.opt.number = true
    vim.opt.relativenumber = true
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

end