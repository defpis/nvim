local present, project_nvim = pcall(require, "project_nvim")
if not present then
   return
end

project_nvim.setup {}

local present, telescope = pcall(require, "telescope")
if present then
   telescope.load_extension "projects"
end
