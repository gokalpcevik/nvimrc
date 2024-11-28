vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

return {
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false
  },
  {
    "danishprakash/vim-yami",
    lazy = false,
    priority = 1000
  },
  {
    "andreasvc/vim-256noir",
    lazy = false,
    priority = 1000,
  },
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false
  },
  -- Borland!
  {
    "letorbi/vim-colors-modern-borland",
    priority = 1000,
    lazy = false
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false
  },

  {
    "rhysd/vim-color-spring-night",
    name = "spring-night",
    priority = 1000,
    lazy = false
  },

  {
    "whizikxd/naysayer-colors.nvim",
    priority = 1000,
    lazy = false,
  },

  {
    "fenetikm/falcon",
    name = "falcon",
    priority = 1000,
    lazy = false
  },

  {
    "rktjmp/lush.nvim",
    lazy = false
  },

  -- which-key
  {
    "folke/which-key.nvim",
    lazy = true
  },

  -- Startup time profiling
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function() vim.g.startuptime_tries = 10 end
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = {},
    config = function(_, opts)
      require('dashboard').setup(opts)
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  -- web-devicons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Pretty UI
  { "stevearc/dressing.nvim",      event = "VimEnter" },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('setup.telescope')
    end
  },
  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require('setup.nvim-tree'),
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end
  },
  -- Barbar - tabline
  {
    'romgrk/barbar.nvim',
    lazy = true,
    priority = 1000,
    event = { 'BufEnter' },
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function(_, opts)
      vim.g.barbar_auto_setup = false
      require('setup.barbar')
      require('barbar').setup(opts)
    end,
    opts = {
      animation = true,
      insert_at_start = true,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- amongst your other plugins
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = require('setup.toggleterm'),
    config = function(_, opts)
      require('toggleterm').setup(opts)
    end
  },

  -- Lualine - status line
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    priority = 1000,
    event = { 'BufEnter' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- let lazy.nvim call setup for lualine with lualine.setup{opts}
    opts = require('setup.lualine'),
    config = function(_, opts)
      require('lualine').setup(opts)
    end
  },

  -- Neodev
  {
    "folke/neodev.nvim",
  },
  -- LSP Stuff
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true
  },

  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' }
    },
    config = function()
      require('setup.lsp')
    end
  },

  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "WinEnter", "BufEnter" },
    dependencies = {
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim"
      },
    },
    opts = function()
      return require('setup.cmp-opts')
    end,
    config = function(_, opts)
      require('setup.cmp').setup(opts)
    end
  },

  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    priority = 1000,
    config = function()
      require('setup.treesitter')
    end
  },
  -- Illuminate (highlight the same word)
  {
    'RRethy/vim-illuminate',
    lazy = true,
    event = { "BufEnter" },
    priority = 1000,
    opts = require('setup.illuminate'),
    config = function(_, opts)
      require('illuminate').configure(opts)
    end
  },
}
