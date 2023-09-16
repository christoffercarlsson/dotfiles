local overriden_modules = function(modules)
  table.remove(modules, 3)
  table.remove(modules, 4)
  table.remove(modules)
  table.remove(modules)
  table.remove(modules)
  local buffer_name = vim.fn.expand "%:t"
  if buffer_name == "" or buffer_name == "." or buffer_name:match"^NvimTree" then
    modules[2] = "%#St_file_sep#"
  else
    local row, column = unpack(vim.api.nvim_win_get_cursor(0))
    table.insert(modules, "%#St_file_info# " .. row .. ":" .. column .. " ")
  end
end

return overriden_modules
