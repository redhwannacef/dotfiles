alias e="exit"
alias cdw='cd ~/workspace'

alias g='git'
alias g='git'
alias gl='g p'
alias gs='g s'
alias gp='g p'
alias gb='g b'
alias gd='g d'
alias glo="g l"
alias gc='g c'
alias gco='git checkout'
alias gw='git worktree'
alias ga='git add'
alias gm='git merge'
alias gf='git fetch --all -p'
alias gca='git commit --amend'

alias n='npm'
alias nr='npm run'

alias gg='lazygit'
alias lzg='lazygit'
alias lzd='lazydocker'
alias lzs='lazysql'

alias ls="eza --icons --group-directories-first"
alias l="ls -l"
alias ll="ls -la"
alias tree='ls --tree --level 2'
alias t='tree'

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias o="open ."

function gr -d "Rebase ontop of deault branch or supplied branch"
    if test (count $argv) -eq 0
        set default_branch (git remote show origin | awk '/HEAD branch/ {print $NF}')
        git rebase origin/$default_branch
    else
        git rebase $argv
    end
end

function kill_port -d "Kill process given a port"
    kill -9 $(lsof -t -i:$argv -sTCP:LISTEN)
end

function v -d "Run Neovim in current working directory or supplier directory"
    if count $argv >/dev/null
        nvim $argv
    else
        nvim .
    end
end
