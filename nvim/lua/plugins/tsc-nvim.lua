if false then
  return {}
end

return {
  "dmmulroy/tsc.nvim",
  config = function()
    local tsconfig = vim.fn.findfile("tsconfig.app.json", ".;")

    require("tsc").setup({
      flags = "--noEmit --project" .. " " .. "apps/service-party/tsconfig.app.json",
    })
  end,
}
