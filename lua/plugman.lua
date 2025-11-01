local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- The classic theme
  { 'ellisonleao/gruvbox.nvim' },
  -- To move the cursor quickly
  { 'ggandor/leap.nvim' },
  -- Syntax
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  -- Debugging
  { 'puremourning/vimspector', lazy = false },
  -- LaTeX support (has conceal feature)
  { 'lervag/vimtex' },
  -- To open files by name
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  -- Integration with Git
  { 'lewis6991/gitsigns.nvim' },
  -- Integration with language servers
  { 'neovim/nvim-lspconfig' },
  -- Auto-completion
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip', -- must match the snippet plugin
    },
  },
  -- Snippets
  { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
  -- Integration with formatters
  { 'stevearc/conform.nvim', opts = {} },
  -- Integration with linters
  { 'mfussenegger/nvim-lint', event = { 'BufReadPre', 'BufNewFile' } },
  -- Markdown rendering
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  -- Rust support
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  { 'rust-lang/rust.vim' }, -- для автокоманд cargo fmt и синтаксиса

  -- Languages that `nvim-treesitter` does not support
  -- Lama
  { 'vpunch/vim-lama-syntax' },
  -- Promela
  { 'blyoa/vim-promela-syntax' },
  -- Jinja2
  { 'glench/vim-jinja2-syntax' },
  -- GraphQL
  { 'jparise/vim-graphql' },
  -- To display buffers
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- Auto-switching a keyboard layout
  { 'lyokha/vim-xkbswitch', tag = '0.20', lazy = false },
  -- Remote connection by ssh
  {
       "amitds1997/remote-nvim.nvim",
       version = "*", -- Pin to GitHub releases
       dependencies = {
           "nvim-lua/plenary.nvim", -- For standard functions
           "MunifTanjim/nui.nvim", -- To build the plugin UI
           "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
       },
       config = true,
  },
  -- List of entities
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'onsails/lspkind.nvim',
  },
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
  },
}
