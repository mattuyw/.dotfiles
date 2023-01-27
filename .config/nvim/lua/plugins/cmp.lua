vim.opt.completeopt = { "menu", "menuone", "noselect" }

return function(use)
    use({
        "hrsh7th/nvim-cmp",
        requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp", -- neovim's built-in language server client
            --'hrsh7th/cmp-nvim-lua', -- complete neovim's Lua runtime API such vim.lsp.*
			'hrsh7th/cmp-path', -- filesystem paths
            'f3fora/cmp-spell', 
			'hrsh7th/cmp-emoji',
            "onsails/lspkind-nvim", -- vscode-like pictograms
            "L3MON4D3/LuaSnip", -- https://sbulav.github.io/vim/neovim-setting-up-luasnip/
			"saadparwaiz1/cmp_luasnip",
            "ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
        },
        config = function()
            local cmp = require("cmp")

            -- shows LSP kind for the autocomplete icon+text
            local lspkind = require("lspkind")
            lspkind.init()

            cmp.setup({

				-- completion = { autocomplete = true },

                --view = {
                --    entries = "custom", -- can be "custom", "wildmenu" or "native"
                --},

                formatting = {
                    format = lspkind.cmp_format({
                        with_text = false, -- do not show text alongside icons
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        menu = {
                            buffer = "(Buffer)",
                            emoji = "(Emoji)",
                            nvim_lsp = "(LSP)",
                            path = "(Path)",
                            treesitter = "(Tree)",
                            spell = "(Spell)",
                            luasnip = "(Snippet)",
                        },
                    }),
                },

                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = {
                        i = function(fallback)
                            if not cmp.select_next_item() then
                                fallback()
                            end
                        end,
                    },
                    ["<S-Tab>"] = {
                        i = function(fallback)
                            if not cmp.select_prev_item() then
                                fallback()
                            end
                        end,
                    },
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                }),

                sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
                    {
                        name = "path",
                        priority_weight = 110,
                        max_item_count = 5,
                    },
                    {
                        name = "luasnip",
                        priority_weight = 100,
                        max_item_count = 10,
                    },
                    {
                        name = "treesitter",
                        priority_weight = 90,
                        max_item_count = 10,
                    },
                    {
                        name = "buffer",
                        priority_weight = 80,
                        max_item_count = 5,
                    },
                    {
                        name = "spell",
                        priority_weight = 70,
                        max_item_count = 5,
                    },
                    {
                        name = "emoji",
                        priority_weight = 70,
                        max_item_count = 5,
                    },
                    -- { name = "tags" }, -- pretty slow
                }),
            })

			vim.cmd [[
			  set completeopt=menuone,noinsert,noselect
			  highlight! default link CmpItemKind CmpItemMenuDefault
			]]

			-- https://alpha2phi.medium.com/vim-neovim-plugins-for-a-better-integrated-experience-6accd4c2a52c
-- lsp_document_symbols
cmp.setup.cmdline('/', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp_document_symbol' }
    }, {
      { name = 'buffer' }
    })
})
-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    --completion = { autocomplete = false },
    sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
    })
})
            --cmp.setup.cmdline("/", {
            --    completion = { autocomplete = false },
            --    mapping = cmp.mapping.preset.cmdline({
            --        ["<C-Space>"] = {
            --            c = cmp.mapping.complete(),
            --        },
            --    }),
            --    sources = { --
            --        { name = "buffer" },
            --    },
            --})

            --cmp.setup.cmdline(":", {
            --    completion = { autocomplete = false },
            --    mapping = cmp.mapping.preset.cmdline({
            --        ["<C-Space>"] = {
            --            c = cmp.mapping.complete(),
            --        },
            --        ["<Tab>"] = {
            --            c = function(fallback)
            --                if cmp.visible() then
            --                    cmp.select_next_item()
            --                else
            --                    if cmp.complete() then
            --                        cmp.select_next_item()
            --                    else
            --                        fallback()
            --                    end
            --                end
            --            end,
            --        },
            --    }),
            --    sources = cmp.config.sources({
            --        { name = "path" },
            --        { name = "cmdline" },
            --    }),
            --})

            -- Setup lspconfig.
            -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
            -- capabilities = capabilities
            -- }
        end,
    })
end
