return function(use)
    use({
        "gorbit99/codewindow.nvim",
        config = function()
            require("codewindow").setup({
				exclude_filetypes = {'packer','NvimTree'}
			}).apply_default_keybinds()
        end,
    })
end
