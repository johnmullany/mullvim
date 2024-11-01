if mullvim.work == true then
  local function reload()
    package.loaded["mullvim.simple.colors"] = nil
    require("mini.base16").setup {
      palette = require("mullvim.simple.colors"),
      use_cterm = true,
    }
  end
  reload = vim.schedule_wrap(reload)

  local augroup = vim.api.nvim_create_augroup("colorscheme_dev", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    group = augroup,
    callback = reload,
  })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = augroup,
    pattern = "*simple/colors.lua",
    callback = reload,
  })
end

return {}
