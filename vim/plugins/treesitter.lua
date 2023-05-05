-- #############
-- TreeSitter
-- #############

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
		"python",
		"go",
		"typescript",
		"cpp",
		"lua",
		"json",
		"yaml"
	},
  sync_install = false,
  auto_install = false,
  ignore_install = {
		"javascript"
	},
  highlight = {
    enable = true,
    disable = {
			"lua"
		},
    additional_vim_regex_highlighting = false,
  },
}
