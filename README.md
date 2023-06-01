# dotfiles

## requirements
- bash
- tmux tpm installed
- catppuccin theme for `gnome-terminal`
- language servers
  - pylsp
  - clangd
  - bashls
  - html
  - cssls

## setup
- run `configure.sh`
- start tmux and install plugins `<leader>+I`
- start nvim
  - say no to the custom prompt
  - wait for the packages to be installed
  - run `:Lazy restore` to install/load plugins from the included lockfile

### todo
- download tpm automatically and move to correct dir
- download catppuccin automatically if using gnome-terminal
- download nerdfont automatically and move to local font dir
