return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Mapeamento das linguagens para os formatadores instalados no Mason
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
			},
			-- Opcional: formata automaticamente ao salvar o arquivo
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- Tecla de atalho para formatar manualmente no Modo Normal e Visual (mp)
		vim.keymap.set({ "n", "v" }, "<A-S-f>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Formatar Arquivo / Seleção" })
	end,
}
