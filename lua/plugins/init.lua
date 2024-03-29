return{
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        dir = "/home/moviemaker/opensources/telescope.nvim",
        keys = {
            {'<leader>pf', "<cmd>Telescope find_files<cr>", desc = "Find file"},
        },
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    -- {
    -- "xiyaowong/transparent.nvim"
    -- },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            plugins = {
                gitsigns = true,
                tmux = true,
                kitty = { enabled = false, font = "+2" },
            },
        },
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
    {
        "laytan/cloak.nvim"
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    -- {
    --     "folke/trouble.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
        {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                local blankline = require("ibl")
                blankline.setup({
                    scope = {
                        show_start = false,
                    },
                    indent = {
                        char = "┊",
                        tab_char = "┊",
                        smart_indent_cap = true,
                    },
                    whitespace = {
                        remove_blankline_trail = true,
                    },
                })
            end,
        },

}
}
