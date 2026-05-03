return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    cond = not vim.g.vscode,
    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyrefly",
                "clangd",
                "rust_analyzer",
                "gopls"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    vim.lsp.config(server_name,  {
                        capabilities = capabilities,
                    })
                    vim.lsp.enable(server_name)
                end,
                ["lua_ls"] = function()
                    vim.lsp.config("lua_ls",
                        {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    )
                    vim.lsp.enable({"lua_ls"})
                end,
            },
        })

        if vim.fn.executable("nil") == 1 then
            vim.lsp.config("nil_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("nil_ls")
        end

        -- If needed again, nvim-lspconfig ships the SWI-Prolog command for prolog_ls.
        -- vim.lsp.config("prolog_ls", {
        --     capabilities = capabilities,
        --     root_markers = { "pack.pl", ".git" },
        -- })
        -- vim.lsp.enable("prolog_ls")

        vim.filetype.add({
            extension = {
                pl = "prolog",
            },
        })

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            virtual_text = {
                severity = vim.diagnostic.severity.ERROR,
                source = 'if_many',
            },
            virtual_lines = { only_current_line = true },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '󰌵',
                },
            },
            float = {
                border = 'single',
                format = function(d) return ('%s (%s) [%s]'):format(d.message, d.source, d.code or d.user_data.lsp.code) end,
            },
        })
    end,
}
