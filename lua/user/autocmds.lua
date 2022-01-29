vim.cmd [[
  augroup indentation
    autocmd!
    autocmd FileType lua setlocal tabstop=3 shiftwidth=3
  augroup end
]]

vim.cmd [[ autocmd InsertLeave * lua require('user.im-select').remember() ]]
vim.cmd [[ autocmd InsertEnter * lua require('user.im-select').apply() ]]
