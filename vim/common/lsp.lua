local set = vim.keymap.set
-- ########
-- LSP Configure
-- ########

-- #########
-- mason
-- #########
require("mason").setup{
	log_level=vim.log.levels.TRACE
}


-- #########
-- mason-lspconfig
-- #########
local on_attach = function(client, bufnr)
	if client.name == "phpactor" then
	    client.server_capabilities.documentFormattingProvider = false
	end

	set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition();print('def')<CR>")
	set("n", "<leader>ds", ":split | lua vim.lsp.buf.definition();print('def')<CR>")
	set("n", "<leader>dv", ":vsplit | lua vim.lsp.buf.definition();print('def')<CR>")
	set("n", "<leader>a", "<cmd>lua vim.lsp.buf.hover();print('hover');<CR>")
	set("n", "<leader>w", "<cmd>lua vim.lsp.buf.type_definition();print('type_def')<CR>")
	set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename();print('rename')<CR>")
	set("n", "<leader>f", ":Trouble lsp_references<CR>")
	set("n", "<leader>e", ":Trouble document_diagnostics<CR>")
	-- set("n", "F", "<cmd>lua vim.lsp.buf.formatting();print('formatted')<CR>")
	set("n", "F", "<cmd>lua vim.lsp.buf.format({ async = true });print('formatting')<CR>")
	set("n", "<leader>s", ":LspInfo<CR>")
	set("i", "<C-a>", "<cmd>lua vim.lsp.buf.hover();print('hover')<CR>")
	set("n", "<leader>x", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	set("n", "<leader>v", "<cmd>lua vim.diagnostic.open_float()<CR>")
	-- set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
	-- set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
	-- set("n", "<leader>c", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	-- set("n", "<leader>v", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	-- set("n", "<leader>v", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	-- set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	-- set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	-- set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
end


require("mason-lspconfig").setup {
	ensure_installed = {
		"tsserver",
		"vuels",
		"eslint" ,
		--"gopls",
		"phpactor",
		--"pylsp"
	}
}
require("mason-lspconfig").setup_handlers {
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			-- Disable virtual_text
			handlers = {
				["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = false
				}
				),
			}
		}
	end,
}



-- https://xbgneb0083.hatenablog.com/entry/2022_6_12_avoid_conflict_lsp_hover
-- Neovimのdiagnostics.open_float()とlsp.buf.hover()がかぶってしまうのを防ぐ
local function on_cursor_hold()
	if vim.lsp.buf.server_ready() then
		vim.diagnostic.open_float()
	end
end

local diagnostic_hover_augroup_name = "lspconfig-diagnostic"

local function enable_diagnostics_hover()
	vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
	vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })
end

local function disable_diagnostics_hover()
	vim.api.nvim_clear_autocmds({ group = diagnostic_hover_augroup_name })
end

vim.api.nvim_set_option('updatetime', 500)
enable_diagnostics_hover()

local function on_hover()
	disable_diagnostics_hover()

	vim.lsp.buf.hover()

	vim.api.nvim_create_augroup("lspconfig-enable-diagnostics-hover", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { group = "lspconfig-enable-diagnostics-hover", callback = function()
		vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
		enable_diagnostics_hover()
	end })
end

vim.keymap.set('n', '<Leader><Leader>a', on_hover, opt)



-- ############
-- null-ls
-- ############

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with {
			condition = function(utils)
				return utils.has_file { ".prettierrc", ".prettierrc.js" }
			end,
			prefer_local = "node_modules/.bin",
		},
	},
})
