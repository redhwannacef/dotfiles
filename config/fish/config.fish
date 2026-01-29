source $__fish_config_dir/config.local.fish
source $__fish_config_dir/aliases.fish

zoxide init fish | source
fzf --fish | source
fnm env --use-on-cd --shell fish | source
