local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0}) 
        vim.keymap.set("n", "gD", vim.lsp.buf.implementation, {buffer=0})
    end,
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    end,
}

vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })
