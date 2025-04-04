local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    height = 0.85,       -- 85% of screen height
    width = 0.80,        -- 80% of screen width
    row = 0.35,          -- Centered vertically
    col = 0.50,          -- Centered horizontally
    border = "rounded",  -- Rounded border
  },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept", -- Select multiple files
    },
  },
  fzf_opts = {
    ["--info"] = "inline", -- Show info inline
  },
  grep = {
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --follow",
    -- "--follow" allows searching through symlinks
  },
  files = {
    fd_opts = "--type f --hidden --follow --exclude .git",
    -- "--follow" ensures it finds files through symlinks
  }
})
