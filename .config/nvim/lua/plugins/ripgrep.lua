vim.g.rg_command = "rg --vimgrep -S"
vim.g.rg_highlight = 1
vim.g.rg_apply_mappings = 1

--local opts = {
--    noremap = true,
--    silent = true,
--}

-- vim.api.nvim_set_keymap("n", "<leader>f", ":Rg<CR>", opts)

return function(use)
    use({
        "miki725/vim-ripgrep",
        requires = {
            "stefandtw/quickfix-reflector.vim",
        },
        cmd = "Rg",
    })
end
