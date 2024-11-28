-- Recipes - Automatically adjust NvimTree window to fit the largest(name) folder
local VIEW_WIDTH_FIXED = 30
local view_width_max = VIEW_WIDTH_FIXED -- fixed to start

-- toggle the width and redraw
local function toggle_width_adaptive()
  if view_width_max == -1 then
    view_width_max = VIEW_WIDTH_FIXED
  else
    view_width_max = -1
  end
  require("nvim-tree.api").tree.reload()
end

-- get current view width
local function get_view_width_max()
  return view_width_max
end

-- On attach
local function nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end
  api.config.mappings.default_on_attach(bufnr)


  vim.keymap.set('n', '<F4>', toggle_width_adaptive, opts('Toggle Adaptive Width'))
end

local function toggle_nvim_tree()
  local api = require "nvim-tree.api"
  api.tree.toggle()
end

vim.keymap.set("n", "<C-h>", function()
  toggle_nvim_tree()
end)


-- For floating window, not used atm.
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.8

return {
  sync_root_with_cwd = true,
  sort = { sorter = "case_sensitive" },
  renderer = { group_empty = true },
  filters = { dotfiles = false },
  on_attach = nvim_tree_on_attach,
  view = {
    side = "right",
    width = {
      min = 10,
      max = get_view_width_max
    },
    float = {
      enable = false,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) -
            vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int
        }
      end
    },
  },
}
