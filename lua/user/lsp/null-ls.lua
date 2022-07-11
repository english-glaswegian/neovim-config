local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"yaml",
				"markdown",
				"graphql",
				"handlebars",
				"svelte",
			},
			extra_args = { "--single-quote", "--jsx-single-quote" },
		}),
		formatting.isort,
		formatting.black,
		formatting.stylua,
		diagnostics.eslint_d.with{ extra_filetypes = { "svelte" }, },
		diagnostics.flake8.with({ extra_args = { "--max-line-length=88" } }),
	},
})
