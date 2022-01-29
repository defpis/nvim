local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

bufferline.setup {
   options = {
      offsets = { { filetype = "NvimTree" } }, -- TODO: 消除顶部空白间距
      show_close_icon = false,
      always_show_bufferline = false,
   },
}
