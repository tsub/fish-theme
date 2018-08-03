function prompt_aws_profile
  if [ -z "$AWS_PROFILE" ]
    return
  end

  echo (set_color yellow)" $AWS_PROFILE"(set_color normal)
end

function fish_right_prompt
  set -l aws (prompt_aws_profile)

  echo "$aws"
end
