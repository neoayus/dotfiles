-- vscode.lua: only for the VSCode Neovim session
-- install/load coc.nvim if not already installed, and remap Enter safely

-- helper to check if we're inside VSCode (VSCode sets VSCODE_PID)
if vim.fn.getenv("VSCODE_PID") == "" then
  return  -- not inside VSCode, bail out
end

-- === snippet: safe <CR> behavior to avoid literal <Plug>(coc-snippets-expand-jump) ===
vim.cmd([[
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
]])

-- You can add other VSCode-specific tweaks here

