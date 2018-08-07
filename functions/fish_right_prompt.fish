function fish_right_prompt
  set -l aws (prompt_aws_profile)

  echo "$aws"
end
