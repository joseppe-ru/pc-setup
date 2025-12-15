-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local set_hl = vim.api.nvim_set_hl

local function transparent_back()
  set_hl(0, "Normal", { bg = "none" })
  set_hl(0, "NormalFloat", { bg = "none" })
  set_hl(0, "NormalNC", { bg = "none" })
  set_hl(0, "SignColumn", { bg = "none" })
  set_hl(0, "StatusLine", { bg = "none" })
end

transparent_back()
