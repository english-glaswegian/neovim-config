local neotest_status_ok, neotest = pcall(require, "neotest")
if not neotest_status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-python")({
      dap = { justMyCode = false } }),
    require("neotest-jest"),
	},
})
