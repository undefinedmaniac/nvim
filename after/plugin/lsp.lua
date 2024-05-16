local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "clangd", "rust_analyzer", "jedi_language_server", "jsonls" },
	handlers = {
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        lua_ls = function ()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
        rust_analyzer = function ()
            require("rust-tools").setup {}
        end
	}
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

-- local lspconfig = require("lspconfig")
-- require("mason-lspconfig").setup_handlers {
-- 	-- The first entry (without a key) will be the default handler
-- 	-- and will be called for each installed server that doesn't have
-- 	-- a dedicated handler.
-- 	function (server_name) -- default handler (optional)
-- 		lspconfig[server_name].setup {}
-- 	end,
--     ["lua_ls"] = function ()
--         local lua_opts = lsp_zero.nvim_lua_ls()
--         lspconfig.lua_ls.setup(lua_opts)
--     end,
-- 	-- Next, you can provide a dedicated handler for specific servers.
-- 	-- For example, a handler override for the `rust_analyzer`:
--     ["rust_analyzer"] = function ()
--         require("rust-tools").setup {}
--         -- require("lspconfig").rust_analyzer.setup {
--         --     settings = {
--         --         ['rust-analyzer'] = {
--         --             diagnostics = {
--         --                 enable = true;
--         --             }
--         --         }
--         --     }
--         -- }
--     end
-- }
	
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
})
