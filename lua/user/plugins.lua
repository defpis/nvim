vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local present, packer = pcall(require, "user/packer")
if not present then
   return
end

local get_config = function(plugin_name)
   return string.format('require "user.plugins./%s"', plugin_name)
end

return packer.startup(function(use)
   use { "wbthomason/packer.nvim" }

   use { "famiu/bufdelete.nvim" }

   use {
      "goolord/alpha-nvim",
      config = get_config "alpha-nvim",
   }

   use {
      "folke/which-key.nvim",
      config = get_config "which-key",
   }

   use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = get_config "lualine",
   }

   use {
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = get_config "bufferline",
   }

   use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = get_config "nvim-tree",
   }

   use {
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_config "telescope",
   }

   use {
      "ahmedkhalf/project.nvim",
      config = get_config "project",
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      requires = { "p00f/nvim-ts-rainbow" },
      config = get_config "nvim-treesitter",
      run = ":TSUpdate",
   }

   use {
      "windwp/nvim-autopairs",
      config = get_config "nvim-autopair",
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      config = get_config "indent-blankline",
   }

   use {
      "folke/twilight.nvim",
      config = get_config "twilight",
   }

   use {
      "lewis6991/impatient.nvim",
      config = get_config "impatient",
   }

   use {
      "nvim-neorg/neorg",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_config "neorg",
   }

   -- Completion
   use {
      "hrsh7th/nvim-cmp",
      requires = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
      },
   }
   require "user.plugins.cmp"

   -- Language Server Protocol
   use {
      "neovim/nvim-lspconfig",
      requires = {
         -- Installer
         "williamboman/nvim-lsp-installer",
         -- Formatter
         "jose-elias-alvarez/null-ls.nvim",
      },
   }
   use {
      "folke/trouble.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
   }
   -- use {
   --    "ray-x/navigator.lua",
   --    requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
   -- }
   require "user.plugins.lsp"

   -- Git
   use {
      "TimUntersberger/neogit",
      requires = { "nvim-lua/plenary.nvim" },
   }
   use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
   }
   require "user.plugins.git"

   -- Theme
   -- use { "folke/tokyonight.nvim" }
   use { "catppuccin/nvim", as = "catppuccin" }
   use { "rktjmp/lush.nvim" }
   require "user.plugins.theme"

   -- Comment
   use { "numToStr/Comment.nvim" }
   use {
      "folke/todo-comments.nvim",
      requires = { "nvim-lua/plenary.nvim" },
   }
   require "user.plugins.comment"

   if PACKER_BOOTSTRAP then
      require("packer").sync()
   end
end)
