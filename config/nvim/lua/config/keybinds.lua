-- keybinds.lua

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Navigate to next search occurence and keep it centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Navigate to previous search occurence and keep it centered" })

vim.keymap.set("v", ">", ">gv", { desc = "Increase indent without exiting the selected content" })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent without exiting the selected content" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste clipboard without replacing clipboard content" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying the content" })

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlights", silent = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "Replace word cursor is on globally",
})

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
  desc = "Make file executable",
  silent = true,
})

-- tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current tab in a new tab" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Resize panes equally" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current pane" })

vim.keymap.set("n", "<leader>fp", function()
  -- Get the file path relative to the home directory
  local file_path = vim.fn.expand("%:~")
  -- Copy the file path to the clipboard register
  vim.fn.setreg("+", file_path)
  print("File path copied to clipboard: " .. file_path)
end, { desc = "Copy file path to clipboard" })
