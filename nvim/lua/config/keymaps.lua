-- ==============================
--  General Keymaps
-- ==============================

local map = vim.keymap.set

-- General keymaps
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Move lines up/down
map("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<leader>j", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<leader>k", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Copy file path/location to clipboard
local function copy_to_clipboard(text, label)
  vim.fn.setreg("+", text)
  vim.notify(label .. ": " .. text)
end

map("n", "<leader>cp", function()
  copy_to_clipboard(vim.fn.expand("%:p"), "Copied absolute path")
end, { desc = "Copy absolute file path" })

map("n", "<leader>cr", function()
  copy_to_clipboard(vim.fn.expand("%"), "Copied relative path")
end, { desc = "Copy relative file path" })

map("n", "<leader>cl", function()
  local location = ("%s:%d"):format(vim.fn.expand("%:p"), vim.fn.line("."))
  copy_to_clipboard(location, "Copied file location")
end, { desc = "Copy file path and line" })
