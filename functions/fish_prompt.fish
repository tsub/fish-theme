function prompt_ghq_pwd
  echo (
    pwd \
    | sed "s:^$GHQ_ROOT/github.com/: :" \
    | sed "s:^$GHQ_ROOT/gitlab.com/: :" \
    | sed "s:^$GHQ_ROOT/: :" \
    | sed "s:^$HOME: ~:"
  )
end

function prompt_git_status
  set -l git_status

  if set -l branch_name (git_branch_name)
    set -l branch_status

    if git_is_dirty
      set branch_status "*"
    else
      set branch_status "+"
    end

    set git_status (set_color -o)"($branch_name$branch_status)"(set_color normal)
  end

  echo "$git_status"
end

function fish_prompt
  set -l dir (prompt_ghq_pwd)
  set -l git (prompt_git_status)

  echo "$dir $git"
  echo '$ '
end
