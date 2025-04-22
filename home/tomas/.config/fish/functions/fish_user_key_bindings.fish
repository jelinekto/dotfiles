# prepend doas
bind           \es "fish_commandline_prepend doas"
bind -M insert \es "fish_commandline_prepend doas"

# autopair
set -g autopair_left "(" "[" "{" '"' "'"
set -g autopair_right ")" "]" "}" '"' "'"
set -g autopair_pairs "()" "[]" "{}" '""' "''"

test $fish_key_bindings = fish_default_key_bindings &&
  set --local mode default insert ||
  set --local mode insert default

bind --mode $mode[-1] --erase \177 \b \t

bind --mode $mode[1] \177 _autopair_backspace # macOS ⌫
bind --mode $mode[1] \b _autopair_backspace
bind --mode $mode[1] \t _autopair_tab

printf "%s\n" $autopair_pairs | while read --local left right --delimiter ""
  bind --mode $mode[-1] --erase $left $right
    if test $left = $right
      bind --mode $mode[1] $left "_autopair_insert_same \\$left"
    else
      bind --mode $mode[1] $left "_autopair_insert_left \\$left \\$right"
      bind --mode $mode[1] $right "_autopair_insert_right \\$right"
    end
  end
