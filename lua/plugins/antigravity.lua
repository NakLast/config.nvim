return {
  -- dir = "/home/swd/.gemini/antigravity-cli/scratch/antigravity.nvim",
  dir = "~/Documents/work/antigravity.nvim",
  config = function()
    require("antigravity").setup({
      cmd = "agy",
      width_ratio = 0.3,
      height_ratio = 0.8,
      border = "rounded",
      style = "vsplit",
    })
    vim.keymap.set("n", "<leader>ag", "<cmd>Antigravity<cr>", { desc = "Toggle Antigravity" })
    vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    vim.keymap.set("v", "<leader>aa", function()
      require("antigravity").ask_selection()
    end, { desc = "Ask Antigravity (Selection)" })
  end,
}
