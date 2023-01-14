local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PackerBootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use({
        "wbthomason/packer.nvim",
        opt = false,
    })

    require("plugins.vscode")(use) -- theme, must run "colorscheme vscode"

require("plugins.codewindow")(use)
    -- require("plugins.feline")(use)
require("plugins.lualine")(use)
require("plugins.luatab")(use)

require("plugins.alpha")(use) -- greeter
require("plugins.cmp")(use) -- code completion
require("plugins.colorizer")(use) -- highlighter

--require("plugins.comment")(use) -- code comment shortcuts
require("plugins.ctags")(use) -- https://til.codeinthehole.com/posts/how-to-configure-ctags-to-parse-terraform-files/
    -- https://docs.ctags.io/en/latest/news.html#importing-changes-from-exuberant-ctags
    -- require("plugins.dirbuf")(use) -- edit filesystems in buffer
    -- require("plugins.editorconfig")(use) -- coding style
    -- require("plugins.file")(use) -- open file:linenumber
    -- require("plugins.fugitive")(use) -- git bindings
require("plugins.fzf")(use) -- fuzzy search
	-- ^^^ https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
require("plugins.smoothie")(use)
    --require("plugins.git")(use) -- nicer git commit
--require("plugins.gitsigns")(use) -- git previews
    -- require("plugins.hop")(use) -- nav faster
--require("plugins.incsearch")(use) -- search highlight
--require("plugins.indentline")(use) -- show indent level
require("plugins.lsp")(use) -- language server
--require("plugins.markdown_preview")(use)
    -- require("plugins.maximizer")(use) -- tmux Z
    -- require("plugins.mundo")(use) -- persist undo
--require("plugins.numbertoggle")(use) -- toggle line numbers
    -- require("plugins.oscyank")(use)
    -- require("plugins.pencil")(use)
    --require("plugins.ripgrep")(use)
    -- require("plugins.rsi")(use)
    -- require("plugins.startuptime")(use)
    -- require("plugins.tidy")(use) -- lint
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
require("plugins.tree")(use) -- filetree
    -- need to run :PackerUpdate/PackerSync in nvim again and everything works fine.
require("plugins.treesitter")(use)
    -- need to install pip3 install pynvim to make this happy
    -- require("plugins.vimspector")(use) -- debugger

    -- it conflicts with hop so needs to be initialized last
    -- require("plugins.focus")(use)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PackerBootstrap then
        require("packer").sync()
    end
end)
