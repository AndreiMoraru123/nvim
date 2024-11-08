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
        "L3MON4D3/LuaSnip",
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
                "nil_ls",
                "lua_ls",
                "pyright",
                "clangd",
                "rust_analyzer",
                "tsserver",
                "gopls"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            },
        })

        local lspconfig = require("lspconfig")

        local function disable_highlight(filetype)
            if vim.bo.filetype == filetype then
                for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                    vim.api.nvim_set_hl(0, group, {})
                end
            end
        end

        lspconfig.prolog_ls.setup {
            cmd = { "swipl",
                "-g", "use_module(library(lsp_server)).",
                "-g", "lsp_server:main",
                "-t", "halt",
                "--", "stdio"
            },
            filetypes = { "prolog" },
            root_dir = lspconfig.util.find_git_ancestor,
            single_file_support = true,
            on_attach = function()
                disable_highlight("prolog")
            end,
        }

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
