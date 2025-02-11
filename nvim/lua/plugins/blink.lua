if false then
  return {}
end

return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    sources = {
      compat = {
        "avante_commands",
        "avante_mentions",
        "avante_files",
      },
    },
  },
}
