local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local mode = {
  "mode",
  fmt = function(str)
    return str -- Removes extra symbols around the mode
  end,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 1,           -- 1 = relative path, 0 = filename only
}

local encoding = {
  "encoding",
  cond = hide_in_width,
}

local fileformat = {
  "fileformat",
  icons_enabled = true,
  symbols = {
    unix = "", -- e.g. Unix symbol
    dos = "",  -- e.g. DOS symbol
    mac = "",  -- e.g. Mac symbol
  },
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local location = {
  "location",
  padding = 0,
}

local progress = {
  "progress",
  fmt = function() -- Custom formatter for percentage
    return "%P/%L"
  end,
}

-- LSP Server name
local lsp_name = function()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, filename },
    lualine_c = {{ lsp_name, icon = ' LSP:' }, diagnostics },
    lualine_x = { encoding, filetype },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { branch, filename },
    lualine_c = {},
    lualine_x = { filetype },
    lualine_y = { location },
    lualine_z = { progress },
  },
  tabline = {},
  extensions = {},
})

