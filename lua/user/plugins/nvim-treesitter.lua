local present, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

-- local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_configs.norg_meta = {
--    install_info = {
--       url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
--       files = { "src/parser.c" },
--       branch = "main",
--    },
-- }

-- parser_configs.norg_table = {
--    install_info = {
--       url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
--       files = { "src/parser.c" },
--       branch = "main",
--    },
-- }

nvim_treesitter_configs.setup {
   ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      -- "norg",
      -- "norg_meta",
      -- "norg_table",
   },
   highlight = {
      enable = false,
      use_languagetree = true,
   },
   rainbow = {
      enable = true,
      extended_mode = true,
   },
}
