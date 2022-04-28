local lspconfig = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")
local lspsaga = require('lspsaga')
local lspkind = require('lspkind')
lspkind.init({})
local cmp = require('cmp')
require('utils')

local on_attach = function(client, bufnr)
    -- format on save
    vim.cmd([[
	augroup format
		autocmd!
		autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
	augroup END
]])

    nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    nnoremap('gd',
             [[<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>]])
    nnoremap('gr', '<cmd>Lspsaga rename<cr>')
    nnoremap('gx', '<cmd>Lspsaga code_action<cr>')
    xnoremap('gx', ':<c-u>Lspsaga range_code_action<cr>')
    nnoremap('gu', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]])
    nnoremap('gp',
             [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]])
    --nnoremap('gi', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]])

    require("lsp_signature").on_attach()
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, -- { name = 'vsnip' }, -- For vsnip users.
        {name = 'luasnip'} -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {{name = 'buffer'}}),
    formatting = {
        format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
-- local servers = {'clangd','pyright'}
-- for _, server in ipairs(servers) do 
--	  lspconfig[server].setup({
--		capabilities = capabilities,
--		on_attach = on_attach
--	  })
-- end

lsp_installer.on_server_ready(function(server)
    local opts = {capabilities = capabilities, on_attach = on_attach}
    server:setup(opts)
end)

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

