-- Script taken from https://www.reddit.com/r/vim/comments/k0tti3/comment/gdo6idv/
--
-- vim.fn.sign_define("firstHeadline", {linehl = "markdownFirstHeadline"})
-- vim.fn.sign_define("secondHeadline", {linehl = "markdownSecondHeadline"})
-- vim.fn.sign_define("thirdHeadline", {linehl = "markdownHeadline"})

-- _G.MarkdownHeadlines = function()
--   if vim.bo.filetype ~= "markdown" then
--     return
--   end
--   print("Markdown Headlines")

--   local markdown_sign_namespace = "markdown_sign_namespace"
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.fn.sign_unplace(markdown_sign_namespace, {buffer = vim.fn.bufname(bufnr)})
--   local offset = math.max(vim.fn.line("w0") - 1, 0)
--   local range = math.min(vim.fn.line("w$"), vim.api.nvim_buf_line_count(bufnr))
--   local lines = vim.api.nvim_buf_get_lines(bufnr, offset, range, false)

--   for i = 1, #lines do
--     _, level = lines[i]:find("^#+")
--     if level == 1 then
--       vim.fn.sign_place(0, markdown_sign_namespace, "firstHeadline", bufnr, {lnum = i + offset})
--     end
--     if level == 2 then
--       vim.fn.sign_place(0, markdown_sign_namespace, "secondHeadline", bufnr, {lnum = i + offset})
--     end
--     if level and level > 2 then
--       vim.fn.sign_place(0, markdown_sign_namespace, "thirdHeadline", bufnr, {lnum = i + offset})
--     end
--   end
-- end

-- vim.cmd [[autocmd FileChangedShellPost,Syntax,TextChanged,InsertLeave,WinScrolled * lua MarkdownHeadlines()]]


return {
  "tpope/vim-markdown",
  dependencies = {
    {
      "ellisonleao/glow.nvim",
      config = true,
      cmd = "Glow",
    },
    -- "vim-pandoc/vim-pandoc",
    -- "vim-pandoc/vim-pandoc-syntax",
  },
  ft = { 'markdown' }
}
