return {
	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = { vim.env.VIMRUNTIME },
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},

			nixd = {},
			pyright = {},
			ts_ls = {},
			html = {},
			cssls = {},
			jsonls = {},
			yamlls = {},
			bashls = {},
			clangd = {},
			rust_analyzer = {},
			gopls = {},
			taplo = {},
			marksman = {},
		}

		for server, settings in pairs(servers) do
			vim.lsp.config(server, settings)
			vim.lsp.enable(server)
		end
	end,
}
