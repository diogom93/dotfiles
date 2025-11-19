local o = vim.opt

o.number = true
o.relativenumber = true

o.mouse = "a"

o.showmode = false

o.ignorecase = true
o.smartcase = true

o.splitright = true
o.splitbelow = true

o.inccommand = "split"

o.cursorline = true

o.scrolloff = 10

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.undodir = os.getenv("HOME") .. "/.vimtmp/undo"
o.swapfile = false
