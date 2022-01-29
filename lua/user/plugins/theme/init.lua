-- local present, _ = pcall(require, "tokyonight")
-- if present then
--    vim.g.tokyonight_style = "night"
--    vim.cmd [[ colorscheme tokyonight ]]
-- end

local present, catppuccin = pcall(require, "catppuccin")
if present then
   catppuccin.setup {}
   vim.cmd [[ colorscheme catppuccin ]]
end
