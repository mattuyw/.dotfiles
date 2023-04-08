local opts = {
    noremap = true,
    silent = true,
}

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

return function(use)
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        --tag = 'nightly', -- optional, updated every week. (see issue #1193)
        cmd = {
            "NvimTreeToggle",
        },
        config = function()
            require("nvim-tree").setup({
				-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup#open_on_setup
                sync_root_with_cwd = false,
				tab = {
					sync = {
						open = true
					}
				},
                diagnostics = {
                    enable = false,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {},
                },
                git = {
                    enable = true,
                    ignore = true,
                    timeout = 500,
                },
                view = {
                    width = 30,
                    side = "left",
        mappings = {
          list = {
			{ key = "<C->", action = "split" },
          }
        }
                },
                --trash = {
                --    cmd = "trash",
                --    require_confirm = true,
                --},
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false,
                        },
						resize_window = true,
                    },
                },
            })
        end,
    })
end
