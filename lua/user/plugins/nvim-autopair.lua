local present, nvim_autopair = pcall(require, "nvim-autopair")
if not present then
   return
end

nvim_autopair.setup {}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local present, cmp = pcall(require, "cmp")
if present then
   cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
end
