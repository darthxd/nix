return {
    "folke/lazydev.nvim",
    ft = "lua", -- carrega apenas quando abrir arquivos .lua
    opts = {
        library = {
            -- Carrega tipos do Neovim e luvit
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
