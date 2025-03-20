if vim.g.vscode then
    -- VSCode extension
    vim.opt.clipboard = "unnamedplus"
    for _, client in ipairs(vim.lsp.get_clients()) do
        client.stop(client)  -- Stop the client by its ID
    end
    vim.g.lualine = false
    vim.g.nvim_tree_disable = true
else
    -- ordinary Neovim
    require "user.options"
    require "user.keymaps"
    require "user.plugins"
    require "user.colorscheme"
    require "user.cmp"
    require "user.lsp"
    -- require "user.telescope"
    require "user.treesitter"
    require "user.autopairs"
    require "user.comment"
    require 'nvim-tree'.setup()
    require "user.bufferline"
    require "user.lualine"
    -- require "user.indentline"
    vim.loader.enable()
    require "user.alpha"
    require "user.project"
    require "user.fzf-lua"
end
