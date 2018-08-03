function prompt_ghq_pwd
  echo (pwd | sed "s:^$GHQ_ROOT/::" | sed "s:^$HOME:~:")
end

function fish_prompt
  set -l dir (prompt_ghq_pwd)
  set -l git

  if set -l branch_name (git_branch_name)
    set -l branch_status

    if git_is_dirty
      set branch_status "*"
    else
      set branch_status "+"
    end

    set git (set_color -o)"($branch_name$branch_status)"(set_color normal)
  end

  echo "$dir $git"
  echo '$ '
end
