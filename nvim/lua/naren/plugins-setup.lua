vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
  return
end 

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  
  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  use("folke/tokyonight.nvim") -- tokyonight colorscheme
  use("ellisonleao/gruvbox.nvim") -- classic
  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")
  
  -- commenting with gcc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- icons
  use("kyazdani42/nvim-web-devicons")

 -- statusline
 use("nvim-lualine/lualine.nvim")

 -- vim navigator
 use('christoomey/vim-tmux-navigator')

 -- catppuccin
 use { "catppuccin/nvim", as = "catppuccin" }

-- fuzzy finding
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

if packer_bootstrap then
    require("packer").sync()
  end
end)
