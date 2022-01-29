local M = {}

local keymap_valid_modes = {
   [""] = true,
   ["n"] = true,
   ["v"] = true,
   ["s"] = true,
   ["x"] = true,
   ["o"] = true,
   ["!"] = true,
   ["i"] = true,
   ["l"] = true,
   ["c"] = true,
   ["t"] = true,
}

M.map = function(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }

   if opts then
      options = vim.tbl_extend("force", options, opts)
   end

   local function map_wrapper(_mode, _lhs, _rhs, _opts)
      if type(_mode) == "table" then
         for _, m in ipairs(_mode) do
            map_wrapper(m, _lhs, _rhs, _opts)
         end
      else
         if type(_lhs) == "table" then
            for _, l in ipairs(_lhs) do
               map_wrapper(_mode, l, _rhs, _opts)
            end
         else
            if keymap_valid_modes[_mode] and _lhs and _rhs then
               vim.api.nvim_set_keymap(_mode, _lhs, _rhs, _opts)
            else
               _mode, _lhs, _rhs = _mode or "", _lhs or "", _rhs or ""
               print(
                  "Cannot set mapping [ mode = '" .. _mode .. "' | key = '" .. _lhs .. "' | cmd = '" .. _rhs .. "' ]"
               )
            end
         end
      end
   end

   map_wrapper(mode, lhs, rhs, options)
end

M.buf_map = function(buffer, mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }

   if opts then
      options = vim.tbl_extend("force", options, opts)
   end

   local function map_wrapper(_buffer, _mode, _lhs, _rhs, _opts)
      if type(_mode) == "table" then
         for _, m in ipairs(_mode) do
            map_wrapper(_buffer, m, _lhs, _rhs, _opts)
         end
      else
         if type(_lhs) == "table" then
            for _, l in ipairs(_lhs) do
               map_wrapper(_buffer, _mode, l, _rhs, _opts)
            end
         else
            if keymap_valid_modes[_mode] and _lhs and _rhs then
               vim.api.nvim_buf_set_keymap(_buffer, _mode, _lhs, _rhs, _opts)
            else
               _mode, _lhs, _rhs = _mode or "", _lhs or "", _rhs or ""
               print(
                  "Cannot set buffer mapping [ mode = '"
                     .. _mode
                     .. "' | key = '"
                     .. _lhs
                     .. "' | cmd = '"
                     .. _rhs
                     .. "' ]"
               )
            end
         end
      end
   end

   map_wrapper(buffer, mode, lhs, rhs, options)
end

return M
