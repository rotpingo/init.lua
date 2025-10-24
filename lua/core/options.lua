vim.opt.number = true -- make line numbers default
vim.opt.relativenumber = true -- relative line numbers

--Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

--Enable mouse mode, for resizing splits for example
vim.opt.mouse = "a"

--Don't show the mode, since it's already in the status line
vim.opt.showmode = false

--Enable break indent
vim.opt.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case-insensitive searching unless \C or one of more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

--Keep signcolumn on by default
vim.opt.signcolumn = "yes"

--Decarease update time
vim.opt.updatetime = 250

--Decrease mapped sequence wait time
--Displays which-key popup sooner
vim.opt.timeoutlen = 300

--Configure how new splits would be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

--Sets how neovim will display certain whitespace characters in the editor
-- See `:help 'list'`
-- See `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

--Preview substitutions live, as you type!
vim.opt.inccommand = "split"

--Show which line your cursor is on
vim.opt.cursorline = true

--Minimal number of screen lines to keep above and bellow the cursor.
vim.opt.scrolloff = 6
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`

--Set highlight on search
vim.opt.hlsearch = false

--Creates a backup file
vim.o.backup = false

--If a file is being edited by another program(or was written to file while editing with another program), it is not allowed to be edited
vim.o.writebackup = false

--Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--Which "horizontal" keys are allowed to travel to prev/next line
vim.o.whichwrap = "bs<>[]hl"

--Displays lines as one long line
vim.o.wrap = false

--Companion to wrap don't split words
vim.o.linebreak = true

--Set number column width to 2 {default 4}
vim.o.numberwidth = 2

--The number of spaces inserted for each identation
vim.o.shiftwidth = 4

--Insert n spaces for a tab
vim.o.tabstop = 4

--Number of spaces that a tab counts for while performing editing operations
vim.o.softtabstop = 4

--Convert tabs to spaces
vim.o.expandtab = true

--Don't insert the current commend leader automatically for auto-wrapping comments using 'textwidth', hittint <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.formatoptions:remove({ "c", "r", "o" })

--Always show tabs
vim.o.showtabline = 2
