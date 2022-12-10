local servers = {
	"rust_analyzer",
}
require("mason").setup()

require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require("lspconfig")[server_name].setup({
			capabilities = capabilities
		})
	end,

	["sumneko_lua"] = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require("lspconfig").sumneko_lua.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					}
				}
			}
		})
	end,
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
	}
})

require("mason-null-ls").setup()

require 'mason-null-ls'.setup_handlers({
	function(source_name, methods)
		require('mason-null-ls.automatic_setup')(source_name, methods)
	end,
	prettier = function (source_name, methods)
		null_ls.register(null_ls.builtins.formatting.prettier)
	end,
})

local lspconfig = require('lspconfig')
local default_on_attach = function(_,bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr,...)
	end
	require('keybindings').maplsp(buf_set_keymap)
	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

for _,server in pairs(servers) do
	lspconfig[server].setup({
		on_attach = default_on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	})
end


-- old config with lsp-installer
-- local lsp_installer = require "nvim-lsp-installer"
-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
-- local servers = {
--   sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
--   rust_analyzer = require "lsp.rust",
--   pyright = {},
--   gopls = {},
--   tsserver = {}
--   -- html = {},
--   -- jsonls = {},
--   -- tsserver = {}
-- }
-- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end


-- lsp_installer.on_server_ready(function(server)
--   local opts = servers[server.name]
--   if opts then
--     opts.on_attach = function(_, bufnr)
--       local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--       -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--       -- 绑定快捷键
--       require('keybindings').maplsp(buf_set_keymap)
--     end
--     opts.flags = {
--       debounce_text_changes = 150,
--     }

--     if server.name == "rust_analyzer" then
--       -- Initialize the LSP via rust-tools instead
--       require("rust-tools").setup {
--         -- The "server" property provided in rust-tools setup function are the
--         -- settings rust-tools will provide to lspconfig during init.            -- 
--         -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
--         -- with the user's own settings (opts).
--         print(vim.inspect(opts)),
--         server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
--       }
--       server:attach_buffers()
--     else
--       server:setup(opts)
--     end
--   end
-- end)
-- --

