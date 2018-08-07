function fish_prompt
  set -l dir (prompt_ghq_pwd)
  set -l git (prompt_git_status)

  echo
  echo "$dir $git"
  echo '$ '
end
