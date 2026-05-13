local wiki_dir = vim.env.WIKI_DIR

if wiki_dir and wiki_dir ~= "" then
	vim.fn.jobstart({ "git", "-C", wiki_dir, "pull", "--ff-only" }, {
		detach = true,
		on_exit = function(_, code)
			if code ~= 0 then
				vim.schedule(function()
					vim.notify("Wiki sync pull failed: " .. wiki_dir, vim.log.levels.WARN)
				end)
			end
		end,
	})
end

local function is_wiki_file()
	local bufpath = vim.api.nvim_buf_get_name(0)
	return bufpath:sub(1, #wiki_dir) == wiki_dir
end

local function git_commit_current_file()
	if not is_wiki_file() then
		return
	end
	local file = vim.api.nvim_buf_get_name(0)
	local rel = file:sub(#wiki_dir + 2)
	local msg = "auto: update " .. rel
	vim.fn.jobstart({
		"git",
		"-C",
		wiki_dir,
		"add",
		file,
	}, {
		on_exit = function(_, code)
			if code == 0 then
				vim.fn.jobstart({
					"git",
					"-C",
					wiki_dir,
					"commit",
					"-m",
					msg,
				}, { detach = true })
			end
		end,
	})
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = wiki_dir .. "/*",
	callback = git_commit_current_file,
	desc = "Auto-commit wiki files on save",
})
