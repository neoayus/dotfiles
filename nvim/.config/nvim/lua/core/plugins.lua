local ensure_packer = function()
vim.opt.showcmd = true 
vim.opt.laststatus = 4 
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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  ------------------------------------
  -- fzf
  use {
    'junegunn/fzf',
    run = function() 
      -- This command runs the install script for fzf
      vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/junegunn/fzf.git', '~/.fzf'})
      vim.fn.system({'~/.fzf/install', '--all'})
    end
  }
  -- fzf.vim
  use 'junegunn/fzf.vim'
  -- gruvbox theme 
  use 'morhetz/gruvbox' 
  -- syntax support ( vim polygot )
  use 'sheerun/vim-polyglot' 
  -- gruvbox material theme 
  use 'sainnhe/gruvbox-material'  
  -- neoclide neovim  
  use {'neoclide/coc.nvim', branch = 'release'}

  ----------------------------------------------------------------
  


  -------

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
