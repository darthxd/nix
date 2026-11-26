return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Configuração das capacidades do autocompletar para o LSP
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configuração de diagnósticos na tela
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
		})

		-- Atalhos do LSP quando um buffer com servidor for ativado
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
            end
		})

		-- Servidores e tratadores via mason-lspconfig
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"lua_ls",
				"html",
				"cssls",
				"ts_ls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

                ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                -- Informa explicitamente que 'vim' é uma global reconhecida
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                })
				end,
			},
		})
	end,
}
