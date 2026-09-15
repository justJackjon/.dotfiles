return {
  "snacks.nvim",
  opts = {
    notifier = {
      -- NOTE: Notifications are always right-aligned. Stacking them from the bottom up
      --       (instead of the default top-down) keeps them out of neo-tree's way, since
      --       neo-tree is docked on the right and notifications would otherwise overlap
      --       its contents near the top of the window.
      top_down = false,
    },
  },
}
