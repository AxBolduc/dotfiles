-- Options are automatically loaded before lazy.nvim startup Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false

vim.g.neovide_input_macos_alt_is_meta = true
vim.o.guifont = "Comic Code Ligatures:h14"
vim.g.ai_cmp = false
vim.g.root_spec = { "cwd" }

vim.g.lazyvim_ts_lsp = "vtsls"

vim.api.nvim_create_user_command("OpenPdf", function()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath:match("%.typ$") then
    local pdf_path = filepath:gsub("%.typ$", ".pdf")
    vim.system({ "zathura", pdf_path })
  end
end, {})
