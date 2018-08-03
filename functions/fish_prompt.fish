function prompt_ghq_pwd
  echo (
    pwd \
    | sed "s:^$GHQ_ROOT/github.com/: :" \
    | sed "s:^$GHQ_ROOT/gitlab.com/: :" \
    | sed "s:^$GHQ_ROOT/: :" \
    | sed "s:^$HOME: ~:"
  )
end

# Require Ladicle/git-prompt
function prompt_git_status
  set -l git_status (string split " " (git-prompt))

  if [ (count $git_status) -eq 0 ]
    return
  end

  set -l icon
  switch $git_status[1]
  case 0 # Conflict
    set icon (set_color yellow)""(set_color normal)
  case 1 # Behind
    set icon (set_color red)""(set_color normal)
  case 2 # Ahead or No remote
    set icon (set_color blue)""(set_color normal)
  case 3 # Changed
    set icon (set_color blue)""(set_color normal)
  case 4 # No changed
    set icon (set_color green)""(set_color normal)
  end

  set -l branch
  if [ $git_status[2] = "master" ]
    set branch (set_color -u white)"$git_status[2]"(set_color normal)
  else
    set branch "$git_status[2]"
  end

  # Un-commit change number, Un-staged change number, Un-tracked change number
  set -l numbers
  if [ (count $git_status) -eq 3 ]
    set numbers (set_color yellow)"|  "(set_color white)"$git_status[3]"(set_color normal)
  end

  echo "$icon $branch $numbers"
end

function fish_prompt
  set -l dir (prompt_ghq_pwd)
  set -l git (prompt_git_status)

  echo
  echo "$dir $git"
  echo '$ '
end
