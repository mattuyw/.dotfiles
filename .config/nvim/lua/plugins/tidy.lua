return function(use)
    use({
        "mcauley-penney/tidy.nvim",
        --event = "BufWritePre",
        config = function()
            require("tidy").setup()
        end
    })
end
