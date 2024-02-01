local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local home_directory = vim.fn.expand("~")

local servers = {"kotlin_language_server", "rust_analyzer", "jdtls", "bashls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.groovyls.setup {
  cmd = {"java", "-jar", home_directory .. "/.config/nvim/lua/custom/lsps/groovy-language-server-all.jar"},
  capabilities = capabilities,
  on_attach = on_attach
}

--lspconfig.java_language_server.setup {
--    cmd = {"bash", "/Users/karlo.bartolic/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_mac.sh"},
--    filetypes = {"java"},
--    capabilities = capabilities,
--    on_attach = on_attach
--}
