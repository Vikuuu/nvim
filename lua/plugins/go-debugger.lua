return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>db",
                "<cmd>DapToggleBreakpoint<CR>",
                desc = "Add breakpoint at line",
                mode = "n",
            },
            {
                "<leader>dus",
                function()
                    local widgets = require("dap.ui.widgets")
                    local sidebar = widgets.sidebar(widgets.scopes)
                    sidebar.open()
                end,
                desc = "Open debugging sidebar",
                mode = "n",
            },
        },
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
        keys = {
            {
                "<leader>dgt",
                function()
                    require("dap-go").debug_test()
                end,
                desc = "Debug go test",
                mode = "n",
            },
            {
                "<leader>dgl",
                function()
                    require("dap-go").debug_last()
                end,
                desc = "Debug last go test",
                mode = "n",
            },
        },
    },
}
