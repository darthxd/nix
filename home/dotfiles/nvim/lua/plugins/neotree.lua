return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			-- Configurações gerais da árvore
			filesystem = {
				filtered_items = {
					visible = false, -- Se true, mostra itens filtrados em tom opaco
					hide_dotfiles = false, -- Mostra arquivos ocultos (iniciados com .)
					hide_gitignored = false, -- Mostra arquivos do .gitignore
					hide_hidden = false,
				},
				follow_current_file = {
					enabled = true, -- Foca automaticamente o arquivo aberto no editor dentro da árvore
					leave_dirs_open = false,
				},
				use_libuv_file_watcher = true, -- Atualiza a árvore automaticamente se arquivos mudarem no disco
			},

			-- Layout e tamanho do painel
			window = {
				position = "left",
				width = 32,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				-- Mapeamentos de teclas *dentro* da janela do Neo-tree
				mappings = {
					[""] = "none", -- Desativa o Leader dentro do Neo-tree para não conflitar
					["l"] = "open", -- Tecla 'l' para abrir arquivo ou expandir pasta
					["h"] = "close_node", -- Tecla 'h' para fechar pasta
					["s"] = "open_split", -- Abre arquivo em split horizontal
					["v"] = "open_vsplit", -- Abre arquivo em split vertical
					["t"] = "open_tabnew", -- Abre em uma nova aba
					["a"] = {
						"add",
						config = {
							show_path = "relative", -- Exibe caminho ao criar novos arquivos/pastas
						},
					},
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["c"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["R"] = "refresh",
					["?"] = "show_help",
				},
			},

			-- Ícones e símbolos de interface
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
				git_status = {
					symbols = {
						-- Modificadores de status do Git
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
		})

		-- Atalhos globais no Neovim
		vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Alternar Neo-tree", silent = true })
	end,
}
