return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
          },
        },
      },
      terminal = {
        win = {
          position = "float",
          border = "rounded",
          height = 0.8,
          width = 0.8,
        },
      },
    },
  },
}
