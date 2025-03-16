local function action_noop(_, opts)
  local o = vim.tbl_deep_extend("keep", { resume = true }, opts.__call_opts)
  opts.__call_fn(o)
end

return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      actions = {
        files = {
          true,
          ["ctrl-g"] = { action_noop },
        },
      },
    })
  end,
}
