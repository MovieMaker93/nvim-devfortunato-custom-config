local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

require("lazy").setup('plugins', opts)
require("devfortunato")

vim.keymap.set("n", "<leader>i", vim.cmd.InspectTree)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
--
local ls = require "luasnip"
