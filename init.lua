-- Enhanced init.lua for Neovim

-- General settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.mouse = 'a'            -- Enable mouse support in all modes
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard

-- Indentation and tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true     -- Smart autoindenting

-- Search settings
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Incremental search
vim.opt.ignorecase = true      -- Case insensitive search
vim.opt.smartcase = true       -- Override ignorecase if search has uppercase

-- UI and behavior
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.splitbelow = true      -- Horizontal splits below current window
vim.opt.splitright = true      -- Vertical splits to the right
vim.opt.scrolloff = 8          -- Keep 8 lines visible above/below cursor
vim.opt.signcolumn = 'yes'     -- Always show sign column

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set colorscheme to elflord
vim.cmd.colorscheme('elflord')
