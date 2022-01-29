local present, alpha = pcall(require, "alpha")
if not present then
   return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
   "                                                     ",
   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
   "                                                     ",
}

dashboard.section.buttons.val = {
   dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
   dashboard.button("r", "  Recents", ":Telescope oldfiles<CR>"),
   dashboard.button("s", "  Settings", ":edit $MYVIMRC<CR>"),
   dashboard.button("q", "  Quit", ":quitall<CR>"),
}

local footer = function()
   local total_plugins = #vim.tbl_keys(packer_plugins)
   local datetime = os.date "%d-%m-%Y  %H:%M:%S"
   local plugins_text = "\t" .. total_plugins .. " plugins  " .. datetime

   local fortune = require "alpha.fortune"
   local quote = table.concat(fortune(), "\n")

   return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
