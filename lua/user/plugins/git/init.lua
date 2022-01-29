local present, neogit = pcall(require, "neogit")
if present then
   neogit.setup {}
end

local present, gitsigns = pcall(require, "gitsigns")
if present then
   gitsigns.setup {
      on_attach = function(buffer)
         local utils = require "user.utils"

         utils.buf_map(buffer, "n", "<leader>gd", ":lua require 'gitsigns'.diffthis('HEAD')<CR>")
         utils.buf_map(buffer, "n", "<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>")

         utils.buf_map(buffer, "n", "<leader>gk", ":lua require 'gitsigns'.prev_hunk()<CR>")
         utils.buf_map(buffer, "n", "<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>")

         utils.buf_map(buffer, "n", "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<CR>")
         utils.buf_map(buffer, "n", "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>")

         utils.buf_map(buffer, "n", "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<CR>")
         utils.buf_map(buffer, "n", "<leader>gS", ":lua require 'gitsigns'.stage_buffer()<CR>")

         utils.buf_map(buffer, "n", "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<CR>")
         -- utils.buf_map(buffer, "n", "<leader>gU", ":lua require 'gitsigns'.undo_stage_buffer()<CR>") -- TODO: 支持撤销缓冲区所有暂存
      end,
   }
end
