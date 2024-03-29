local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- (Optional) Configure lua language server for python
require('lspconfig').pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    -- https://www.flake8rules.com/
                    ignore = { 'E201', 'E202', 'E305', 'E302' , 'E501' }
                }
            }
        }
    }
})

-- (Optional) Configure lua language server for emmet_ls (html, css, javascript)
require('lspconfig').emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          -- ["bem.enabled"] = true,
        },
      },
    }
})

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
