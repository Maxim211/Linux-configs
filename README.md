# Linux-configs
Its my list configs linux console programs

# NeoVim
If you wanna set neovim settings, at first intall init.vim to ~/.config/nvim/init.vim, then install vim plug for neovim.
Run nvim and write :PlugInstall.
You need run `npm i -g pyright` for python lsp server, for SQL lsp server need run `go install github.com/lighttiger2505/sqls@latest` and move sqls file to path

### NeoVim hotkeys

gd - if you are on the function, you can go to its definition

:tabnew file - for open file in new tab

gt, gp, gw - for move next and previous between files and gw for close file

ctrl-space - for autocomplite

# Tmux
If you wanna set tmux settings, install .tmux.conf and .tmux.conf.local and too create link in home directory with ln.
If when you run tmux and see "requires perl" - install perl lol.

### Tmux hotkeys

Prefix - Ctrl-a
 
Moving between windows - Alt-l, Alt-h, Alt-k, Alt-j its right, left, up, down, respectively

Copy mode - prefix-enter

Copy mode with vim rules - prefix-\[

Paste - prefix-]

Copied lines selection mode - prefix-P
