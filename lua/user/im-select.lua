local M = {}

M.defaultIM = "com.apple.keylayout.ABC"
M.currentIM = M.defaultIM

M.remember = function()
   M.currentIM = vim.fn.system { "im-select" }
   vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
end

M.apply = function()
   if M.currentIM then
      vim.cmd(":silent :!im-select" .. " " .. M.currentIM)
   else
      vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
   end
end

return M
