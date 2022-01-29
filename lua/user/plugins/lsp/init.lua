local present, _ = pcall(require, "lspconfig")
if present then
   local setup = function()
      local signs = { Hint = "", Info = "", Warn = "", Error = "" }

      for type, icon in pairs(signs) do
         local hl = "DiagnosticSign" .. type
         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- :help vim.diagnostic.config
      vim.diagnostic.config {
         virtual_text = false,
         float = {
            source = "if_many",
         },
         severity_sort = true,
      }

      vim.cmd [[ autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"}) ]]
   end

   setup()

   local on_attach = function(client, buffer)
      local utils = require "user.utils"

      vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

      utils.buf_map(buffer, "n", "gd", ":lua vim.lsp.buf.definition()<CR>")
      utils.buf_map(buffer, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
      utils.buf_map(buffer, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
      utils.buf_map(buffer, "n", "gr", ":lua vim.lsp.buf.references()<CR>")

      utils.buf_map(buffer, "n", "K", ":lua vim.lsp.buf.hover()<CR>")
      utils.buf_map(buffer, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")

      utils.buf_map(buffer, "n", "<Leader>lk", ":lua vim.diagnostic.goto_prev()<CR>")
      utils.buf_map(buffer, "n", "<Leader>lj", ":lua vim.diagnostic.goto_next()<CR>")

      local present, _ = pcall(require, "trouble")
      if present then
         utils.buf_map(buffer, "n", "<Leader>lt", ":TroubleToggle document_diagnostics<CR>")
         utils.buf_map(buffer, "n", "<Leader>lT", ":TroubleToggle workspace_diagnostics<CR>")
      end

      utils.buf_map(buffer, "n", "<Leader>lr", ":lua vim.lsp.buf.rename()<CR>")
      utils.buf_map(buffer, "n", "<Leader>lf", ":lua vim.lsp.buf.formatting()<CR>")

      vim.cmd [[ command! RenameSymbol execute 'lua vim.lsp.buf.rename()' ]]
      vim.cmd [[ command! FormatBuffer execute 'lua vim.lsp.buf.formatting()' ]]

      if client.resolved_capabilities.document_highlight then
         vim.cmd [[
           augroup lsp_document_highlight
             autocmd! * <buffer>
             autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
             autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
           augroup END
         ]]
      end
   end

   local capabilities = vim.lsp.protocol.make_client_capabilities()

   local present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
   if present then
      capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
   end

   local nvim_lsp_installer = require "nvim-lsp-installer"
   local lsp_settings = require "user.plugins.lsp.settings"

   nvim_lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = on_attach,
         capabilities = capabilities,
      }

      if lsp_settings[server.name] then
         opts = vim.tbl_deep_extend("force", lsp_settings[server.name], opts)
      end

      server:setup(opts)
   end)

   local null_ls = require "null-ls"

   null_ls.setup {
      sources = {
         null_ls.builtins.formatting.prettier,
         null_ls.builtins.formatting.stylua,
         null_ls.builtins.code_actions.gitsigns,
      },
   }
end

local present, trouble = pcall(require, "trouble")
if present then
   trouble.setup {}
end

local present, navigator = pcall(require, "navigator")
if present then
   navigator.setup {}
end
