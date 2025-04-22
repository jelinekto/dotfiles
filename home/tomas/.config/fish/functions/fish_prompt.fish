function fish_prompt
  set -l errorcode $status

  if set -q SSH_CLIENT
    set_color bryellow
    echo -n "$USER@$hostname "
  end

  set_color --bold brblue
  echo -n (prompt_pwd)' '

  if test $errorcode -eq 0
    set_color --bold brgreen
  else
    set_color --bold red
  end
  if fish_is_root_user
    echo -n '# '
  else
    echo -n '$ '
  end

  set_color normal
end
