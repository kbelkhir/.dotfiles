-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- Typescript AutoFixImports
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("organise_imports", { clear = true }),
--   pattern = { "*.ts", "*.tsx" },
--   callback = function()
--     vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" }, diagnostics = {} } })
--     vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused.ts" }, diagnostics = {} } })
--   end,
-- })

-- Disable auto-formatting when Claude Code is active
vim.g.claude_code_active = false

-- Track when Claude Code terminal is open
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("claude_code_detection", { clear = true }),
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    -- Check if this is a Claude Code terminal
    if bufname:match("claude") or bufname:match("term://.*claude") then
      vim.g.claude_code_active = true
    end
  end,
})

-- Track when Claude Code terminal is closed
vim.api.nvim_create_autocmd("TermClose", {
  group = vim.api.nvim_create_augroup("claude_code_close", { clear = true }),
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    if bufname:match("claude") or bufname:match("term://.*claude") then
      -- Delay to ensure any pending file writes complete
      vim.defer_fn(function()
        vim.g.claude_code_active = false
      end, 1000)
    end
  end,
})

-- Detect external file modifications and disable auto-formatting
local external_modification_buffers = {}

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = vim.api.nvim_create_augroup("detect_external_changes", { clear = true }),
  callback = function(args)
    -- Mark this buffer as externally modified when Claude Code is active
    if vim.g.claude_code_active then
      external_modification_buffers[args.buf] = true

      -- Set a timer to re-enable formatting after 3 seconds
      vim.defer_fn(function()
        external_modification_buffers[args.buf] = nil
      end, 3000)
    end
  end,
})

-- Override formatting for files modified by Claude Code
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("conditional_format", { clear = true }),
  callback = function(args)
    -- Check if Claude Code is active or buffer was recently modified externally
    if vim.g.claude_code_active or external_modification_buffers[args.buf] then
      -- Store original autoformat state
      if vim.b[args.buf]._original_autoformat == nil then
        vim.b[args.buf]._original_autoformat = vim.b[args.buf].autoformat
      end
      -- Disable format on save
      vim.b[args.buf].autoformat = false
    elseif vim.b[args.buf]._original_autoformat ~= nil then
      -- Restore original autoformat state
      vim.b[args.buf].autoformat = vim.b[args.buf]._original_autoformat
      vim.b[args.buf]._original_autoformat = nil
    end
  end,
})

-- Additional detection for files that change without triggering FileChangedShell
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CursorHold" }, {
  group = vim.api.nvim_create_augroup("check_external_changes", { clear = true }),
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- Also disable formatting when files are reloaded while Claude Code is active
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("claude_code_reload", { clear = true }),
  callback = function(args)
    if vim.g.claude_code_active then
      external_modification_buffers[args.buf] = true
      vim.defer_fn(function()
        external_modification_buffers[args.buf] = nil
      end, 3000)
    end
  end,
})

