function fish_prompt
  set -l dir (prompt_ghq_pwd)
  set -l git (prompt_git_status)
  set -l aws (prompt_aws_profile)

  echo

  if [ -z "$aws" ]
    echo "$dir $git"
  else
    echo "$dir $aws $git"
  end

  echo '$ '
end
