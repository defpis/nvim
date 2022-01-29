local present, cmp = pcall(require, "cmp")
if present then
   local kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
   }

   cmp.setup {
      sources = {
         { name = "nvim_lsp" },
         { name = "buffer" },
         { name = "path" },
      },
      formatting = {
         fields = { "kind", "abbr", "menu" },
         format = function(entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
               nvim_lsp = "[LSP]",
               buffer = "[BUFFER]",
               path = "[PATH]",
            })[entry.source.name]
            return vim_item
         end,
      },
   }
end
