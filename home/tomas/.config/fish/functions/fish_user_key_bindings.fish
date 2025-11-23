# prepend doas
bind           \es "fish_commandline_prepend doas"
bind -M insert \es "fish_commandline_prepend doas"

# make alt+key operate on words instead of entire arguments
bind -M insert alt-left  prevd-or-backward-word
bind -M insert alt-right nextd-or-forward-word
bind -M insert alt-backspace backward-kill-word
bind -M insert alt-delete  kill-word
bind -M default alt-left  prevd-or-backward-word
bind -M default alt-right nextd-or-forward-word
bind -M default alt-backspace backward-kill-word
bind -M default alt-delete  kill-word

# Ctrl+j/k cycles through pager items
for mode in insert default
  bind -M $mode \cj 'if commandline --paging-mode
                       commandline -f down-line
                     else
                       commandline -f down-or-search
                     end'
  bind -M $mode \ck 'if commandline --paging-mode
                       commandline -f up-line
                     else
                       commandline -f up-or-search
                     end'
end

# system clipboard integration
bind yy kill-whole-line yank yank_to_clipboard
bind Y  kill-whole-line yank yank_to_clipboard
bind -M visual -m default y kill-selection yank yank_to_clipboard end-selection repaint-mode
bind p fish_clipboard_paste
bind P fish_clipboard_paste

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
