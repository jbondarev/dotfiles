return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = 'v0.2.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      {
        "<leader>ff",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore=false,
            hidden=true 
          })
        end
      },
      {
        "<leader>fg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end
      }
    }
  }
}
