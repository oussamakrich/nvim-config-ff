local map = vim.keymap.set
--local empty = {}
--local opt = {silent = true}

------------
--- Windows
------------

-- create
map("n", "<leader>wv", 		[[<C-w>v]], {desc = "vertical split"})
map("n", "<leader>ws", 		[[<C-w>s]], {desc = "horizontal split"})

-- resize
map("n", "<C-M-Left>", 	[[<C-w><]], {desc = "resize window"})
map("n", "<C-M-Down>", 	[[<C-w>+]], {desc = "resize window"})
map("n", "<C-M-Up>", 	[[<C-w>-]], {desc = "resize window"})
map("n", "<C-M-Right>", [[<C-w>>]], {desc = "resize window"})
map("n", "<leader>w=",  [[<C-w>=]], {desc = "resize window to be equal"})

-- maximizer
map("n", "<leader>wm", [[<C-w>|]], {desc = "maximize current window"})

-- navigation
map("n", "<C-Left>", 		[[:wincmd h<cr>]], {desc = "goto the left window"})
map("n", "<C-Down>", 		[[:wincmd j<cr>]], {desc = "goto the bottom window"})
map("n", "<C-Up>",			[[:wincmd k<cr>]], {desc = "goto the right window"})
map("n", "<C-Right>", 		[[:wincmd l<cr>]], {desc = "goto the right window"})

-- i navigation
map("i", "<C-h>", 		[[<Left>]], {desc = "goto the left window"})
map("i", "<C-j>", 		[[<Down>]], {desc = "goto the bottom window"})
map("i", "<C-k>",		[[<Up>]], {desc = "goto the right window"})
map("i", "<C-l>", 		[[<Right>]], {desc = "goto the right window"})

map("v", "<M-j>", 		[[ dpV]], {desc = "switch current with next"})
map("v", "<M-k>",		[[ dkPV]], {desc = "switch current with prev"})

-- buf navigation
map("n", "<M-Down>",	[[gt]],							{desc = "goto prev tab"})
map("n", "<M-Up>",		[[gT]], 						{desc = "goto next tab"})
map("n", "<M-Left>",	[[<cmd>TablineBufferPrev<cr>]],	{desc = "goto next buffer"})
map("n", "<M-Right>",	[[<cmd>TablineBufferNext<cr>]],	{desc = "goto prev buffer"})
map("n", "<M-t>",		[[<cmd>TablineTabNew<cr>]],		{desc = "create new tab"})
map("n", "<M-r>",		[[:TablineTabRename ]],			{desc = "rename current tab"})

-- close
map("n", "<leader>wc", 		[[<C-w>c]], {desc = "close current buffer"})

-- switch split
map("n", "<C-S-Left>"	, 		[[:wincmd H<cr>]], {desc = "switch current window with left one"})
map("n", "<C-S-Down>"	, 		[[:wincmd J<cr>]], {desc = "switch current window with bottom one"})
map("n", "<C-S-Up>"	, 			[[:wincmd K<cr>]], {desc = "switch current window with top one"})
map("n", "<C-S-Right>", 		[[:wincmd L<cr>]], {desc = "switch current window with right one"})

-- utils
map("n", "<C-c>", "<cmd> %y+ <CR>", {desc = "copy whole file"})

-- nvim-tree
map("n", "<leader>n", ":NvimTreeToggle<CR>",	{desc = "open nvim tree"})
map("n", "<leader>e", ":NvimTreeFocus<CR>",		{desc = "focus nvim tree"})

--------------
--- LSP ./config/nvim-lspconfig.lua
--- hint : gf to navigate to file under cursor
--------------

--------------
--- Run
--------------

-- Android
map("n", "<leader>ra", require('run.android').run)

-- Make c
map("n", "<leader>m", 	[[ :make ]])
map("n", "<leader>rmc", [[ :make clean ]])
map("n", "<leader>rma", [[ :make fclean ]])
map("n", "<leader>rmr", [[ :make fclean all ]])

-- Norm
map("n", "<leader>rn", [[ :! norminette % ]])

-----------
--- Open
-----------

-- Terminal
map("n", "<C-k>", require('ft_terminal').open, {desc = "toggle terminal"})

-------------
--- buffers
-------------
map("n", "<leader>bc", [[<Cmd>bp|bd #<CR>]], {desc = "close current buffer"}) -- close buffer
map("n", "<leader>bs", [[:w]], {desc = "save current buffer"}) -- save buffer

-------------
-- telescope
-------------

-- basics
map({"n", "i"}, "<M-f>",	require('telescope.builtin').find_files, {desc = "list files with telescope"})
map({"n", "i"}, "<M-h>",	":Thm<CR>", {desc = "list themes with telescope"})
map("n", "<leader>fb", 		require('telescope.builtin').buffers,	{desc = "list buffers"})
map("n", "<leader>fh", 		require('telescope.builtin').help_tags,	{desc = "list help tags"})
map("n", "<leader>fm", 		require('telescope.builtin').marks,		{desc = "list marks"})
map("n", "<leader>fg",		require('telescope.builtin').git_files,	{desc = "list git files"})
map("n", "<leader>fs", 		function ()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end, {desc = "grep for words"})
map("n", "<leader>fw", 		function ()
	require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end, {desc = "grep for function"})

-- android
map("n", "<Leader>fa", 		function ()
	require('telescope.builtin').find_files({cwd="app/src/main",path_display={'tail'}})
end)

-- git

--- ------------------------
--- Other
--- ------------------------

map('x', "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"')
map('x', "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"')

map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- registers
map("v", "p", 	[["_dP]])

map("n", "<leader>y", 	[["+y]])
map("v", "<leader>y", 	[["+y]])
map("n", "<leader>Y", 	[["+Y]])

-- map("", "<Up>", "<Nop>")
-- map("", "<Down>", "<Nop>")
-- map("", "<Right>", "<Nop>")
-- map("", "<Left>", "<Nop>")

map("n", "<leader>i", 	[[p<C-a>Y]])

-- terminal
map("t","<Esc>", [[ <C-\><C-n>]])

---- COMMANDS
vim.cmd("command -complete=lua -nargs=+ Inspect :lua print(vim.inspect(<args>))")
vim.cmd("command -nargs=* Gcc :lua require'run.gcc'.run('') ")
vim.cmd("command -nargs=* GccWall :lua require'run.gcc'.run('-Wall -Werror -Wextra') ")
