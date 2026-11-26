return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        search = {
            -- Permite buscar em todas as janelas visíveis de uma vez
            multi_window = true,
        },
        modes = {
            -- Melhora a busca padrão do Vim (/) integrando a navegação do Flash
            search = {
                enabled = false,
            },
            -- Adiciona rótulos de salto ao usar f, F, t, T nativos
            char = {
                enabled = true,
                keys = { "f", "F", "t", "T", ";", "," },
            },
        },
    },
    -- Atalhos de teclado principais
    keys = {
        {
            "gw",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash (Saltar)",
        },
    },
}
