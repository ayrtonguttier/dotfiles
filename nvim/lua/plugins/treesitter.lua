return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            vim.cmd "TSUpdate"
        end,
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                auto_install = true,
                ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
