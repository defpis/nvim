local present, nvim_tree = pcall(require, "nvim-tree")
if not present then
   return
end

vim.g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      untracked = "✗",
      unstaged = "U",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      ignored = "◌",
   },
   folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
   },
}

local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- :help nvim-tree.<OPTION>
nvim_tree.setup {
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
   trash = {
      cmd = "trash -F",
      require_confirm = true,
   },
   view = {
      mappings = {
         custom_only = true,
         list = {
            { key = "q", cb = tree_cb "close" },
            { key = "?", cb = tree_cb "toggle_help" },

            { key = "a", cb = tree_cb "create" },
            { key = "r", cb = tree_cb "rename" },

            { key = "d", cb = tree_cb "trash" },
            { key = "D", cb = tree_cb "remove" },

            { key = "x", cb = tree_cb "cut" },
            { key = "c", cb = tree_cb "copy" },
            { key = "v", cb = tree_cb "paste" },

            { key = "gy", cb = tree_cb "copy_name" },
            { key = "y", cb = tree_cb "copy_path" },
            { key = "Y", cb = tree_cb "copy_absolute_path" },

            { key = "<Tab>", cb = tree_cb "preview" },
            { key = "i", cb = tree_cb "cd" },
            -- { key = "o", cb = tree_cb "cd_parent" }, -- TODO: 支持回到父目录
            { key = "h", cb = tree_cb "close_node" },
            { key = { "l", "<CR>" }, cb = tree_cb "edit" },
            { key = "p", cb = tree_cb "parent_node" },

            { key = "s", cb = tree_cb "vsplit" },
            { key = "S", cb = tree_cb "split" },

            { key = "gr", cb = tree_cb "refresh" },
         },
      },
   },
}
