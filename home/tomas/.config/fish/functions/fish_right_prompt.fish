function fish_right_prompt
  set_color --bold brmagenta
  [ -d "$PWD"/.git ]
  and git rev-parse --abbrev-ref HEAD 2>/dev/null
  and set -l gitchanges (git diff --numstat | wc -l)
  and if test $gitchanges -gt 0
    echo -n "[$gitchanges]"
  end
  and echo -n ' '

  set_color brblack
  if test $CMD_DURATION -gt 3600000
    date -d@(math $CMD_DURATION/1000) -u '+%H:%M:%S '
  else if test $CMD_DURATION -gt 60000
    date -d@(math $CMD_DURATION/1000) -u '+%M:%S '
  else if test $CMD_DURATION -gt 30000
    date -d@(math $CMD_DURATION/1000) -u '+%Ss '
  end

  set_color normal
end
