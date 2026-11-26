return {{
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
        require("mini.bufremove").setup()
    end,
},
{
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
        "echasnovski/mini.bufremove",
	},
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers", -- Exibe os buffers abertos como abas
				separator_style = "thin", -- Estilo das abas: "slant" | "slope" | "thick" | "thin"
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				color_icons = true,

				-- Integração visual para afastar as abas quando o Neo-tree estiver aberto
				offsets = {
					{
						filetype = "neo-tree",
						text = "NeoTree",
						text_align = "left",
						highlight = "Directory",
					},
				},

				-- Exibe indicadores de erro/aviso do LSP diretamente nas abas
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})

		-- Atalhos para navegação entre abas
		local map = vim.keymap.set

		-- Ir para a aba anterior / próxima
		map("n", "<A-h>", ":BufferLineCyclePrev<CR>", { desc = "Aba Anterior", silent = true })
		map("n", "<A-l>", ":BufferLineCycleNext<CR>", { desc = "Próxima Aba", silent = true })

		-- Mover a aba atual para a esquerda / direita
		map("n", "<A-S-h>", ":BufferLineMovePrev<CR>", { desc = "Mover Aba para Esquerda", silent = true })
		map("n", "<A-S-l>", ":BufferLineMoveNext<CR>", { desc = "Mover Aba para Direita", silent = true })

        map("n", "<A-q>", function()
            local bd = require("mini.bufremove").delete
            if vim.bo.modified then
                local choice = vim.fn.confirm("Save changes before closing?", "&Yes\n&No\n&Cancel")
                if choice == 1 then
                    vim.cmd.write()
                    bd(0)
                elseif choice == 2 then
                    bd(0, true) -- força o fechamento sem salvar
                end
            else
                bd(0)
            end
        end, { desc = "Fechar Buffer Atual", silent = true })

		-- Alternar para abas específicas por número (1 a 9)
		for i = 1, 9 do
			map("n", "<A-" .. i .. ">", function()
				bufferline.go_to(i, true)
			end, { desc = "Ir para Aba " .. i })
		end
	end,
}}
