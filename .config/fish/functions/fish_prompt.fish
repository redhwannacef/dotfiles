function fish_prompt -d "Shell prompt function"
    printf '%s%s > ' (_prompt) (_git_prompt)
end

function _prompt
    echo -n -s (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function _git_prompt
    if not _git_is_repo
        return 1
    end

    set changes echo (git status -s --ignore-submodules=dirty)
    if test ($changes)
        set git_changes echo (set_color yellow)'*'(set_color blue)
    else
        set git_changes echo ''
    end

    set git_branch echo (git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    echo -n -s (set_color blue) ' (' ($git_branch)($git_changes)')' (set_color normal)
end

function _git_is_repo
    test -d .git
    or begin
        set -l info (command git rev-parse --git-dir --is-bare-repository 2>/dev/null)
        and test $info[2] = false
    end
end
