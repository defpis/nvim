local install_packer = function(install_path)
   vim.fn.delete(install_path, "rf")

   print "Cloning packer..."
   local bootstrap = vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
   }

   vim.cmd [[ packadd packer.nvim ]]

   local present, packer = pcall(require, "packer")
   if present then
      print "Packer cloned successfully"
   else
      error("Couldn't clone packer!\nPacker path: " .. install_path .. "\n" .. packer)
   end

   return bootstrap
end

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = install_packer(install_path)
end

local present, packer = pcall(require, "packer")
if not present then
   error("Couldn't load packer!\nPacker path: " .. install_path .. "\n" .. packer)
end

packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float {}
      end,
   },
}

return packer
