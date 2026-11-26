return {
    -- Tema Oxocarbon
    -- {
    --     "nyoom-engineering/oxocarbon.nvim",
    --     lazy = false,
    --     build = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("oxocarbon")
    --     end,
    -- },

    -- Interface moderna para comandos e notificações
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        },
    },

    -- Menu de Busca/Telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<leader>f",  ":Telescope find_files<CR>", desc = "Buscar arquivos" },
            { "<leader>/",  ":Telescope live_grep<CR>",  desc = "Buscar texto no projeto" },
            { "<leader>bb", ":Telescope buffers<CR>",    desc = "Listar buffers" },
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = { prompt_position = "top", preview_width = 0.55 },
                    width = 0.87,
                    height = 0.8,
                },
            },
        },
    },
}
