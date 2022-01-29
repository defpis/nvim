local present, telescope = pcall(require, "telescope")
if not present then
   return
end

telescope.setup {
   defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      path_display = { "smart" },
      mappings = {
         i = {
            ["<C-h>"] = "which_key",
         },
      },
   },
   pickers = {
      buffers = {
         mappings = {
            i = {
               ["<C-d>"] = "delete_buffer",
            },
         },
      },
   },
}
