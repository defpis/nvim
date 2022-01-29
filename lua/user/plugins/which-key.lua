local present, which_key = pcall(require, "which-key")
if not present then
   return
end

which_key.register({
   ["q"] = {
      name = "+quit",
      ["q"] = { ":quit!<CR>", "Quit" },
      ["a"] = { ":quitall!<CR>", "Quit All" },
   },
   ["o"] = {
      name = "+open",
      ["d"] = { ":Alpha<CR>", "Dashboard" },
      ["e"] = { ":NvimTreeToggle<CR>", "Explorer" },
   },
   ["s"] = {
      name = "+search",
      ["s"] = { ":Telescope live_grep<CR>", "Search" },
      ["p"] = { ":Telescope projects<CR>", "Projects" },
      ["r"] = { ":Telescope oldfiles<CR>", "Recents" },
      ["f"] = { ":Telescope find_files<CR>", "Files" },
      ["b"] = { ":Telescope buffers<CR>", "Buffers" },
      ["t"] = { ":TodoTelescope<CR>", "Todos" },
   },
   ["t"] = {
      name = "+toggle",
      ["t"] = { ":Twilight<CR>", "Twilight" },
   },
   ["g"] = {
      name = "+git",
      ["f"] = { ":Telescope git_files<CR>", "Files" },
      ["c"] = { ":Telescope git_commits<CR>", "Commits" },
      ["b"] = { ":Telescope git_branches<CR>", "Branches" },
      ["g"] = { ":Telescope git_status<CR>", "Status" },
      ["h"] = { ":Telescope git_stash<CR>", "Stash" },
      ["d"] = { "Diff This" },
      ["l"] = { "Blame Line" },
      ["k"] = { "Prev Hunk" },
      ["j"] = { "Next Hunk" },
      ["r"] = { "Reset Hunk" },
      ["R"] = { "Reset Buffer" },
      ["s"] = { "Stage Hunk" },
      ["S"] = { "Stage Buffer" },
      ["u"] = { "Undo Hunk" },
      -- ["U"] = { "Undo Buffer" }, -- TODO: 支持撤销缓冲区所有暂存
   },
   ["l"] = {
      name = "+lsp",
      ["r"] = { "Rename Symbol" },
      ["f"] = { "Format Buffer" },
      ["k"] = { "Prev Diagnostic" },
      ["j"] = { "Next Diagnostic" },
      ["t"] = { "Document Diagnostic" },
      ["T"] = { "Workspace Diagnostic" },
   },
   ["b"] = {
      name = "+buffer",
      ["b"] = { ":Telescope buffers<CR>", "Buffers" },
      ["d"] = { ":lua require 'bufdelete'.bufdelete(0)<CR>", "Delete Buffer" },
      ["w"] = { ":lua require 'bufdelete'.bufwipeout(0)<CR>", "Wipeout Buffer" },
   },
}, { prefix = "<Leader>" })
