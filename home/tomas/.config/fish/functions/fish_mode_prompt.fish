function fish_mode_prompt
  switch $fish_bind_mode
    case default
      echo -en "\e[1 q"
    case insert
      echo -en "\e[5 q"
    case replace_one
      echo -en "\e[3 q"
    case visual
      echo -en "\e[1 q"
    case '*'
      echo -en "\e[1 q"
  end
end
